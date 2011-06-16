require "net/http"
require "net/https"
require "uri"
require "yaml"
require "multi_json"

class CentrumFaktur::Connection
  attr_reader :response, :path
  attr_accessor :login, :password, :subdomain

  def initialize(options = {})
    self.login = options.fetch(:login, CentrumFaktur.login) || raise(ArgumentError.new("You must specify login"))
    self.password = options.fetch(:password, CentrumFaktur.password) || raise(ArgumentError.new("You must specify password"))
    self.subdomain = options.fetch(:subdomain, CentrumFaktur.subdomain) || raise(ArgumentError.new("You must specify subdomain"))
  end

  def http
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http
  end

  def uri
    @uri ||= URI.parse("https://#{subdomain}.centrumfaktur.pl")
  end

  def format
    @format ||= :json
  end

  # TODO: unify
  def get(to, params = {})
    @format = params.fetch(:format, :json)
    @path = CentrumFaktur::Utils.path_with_params(to, params)
    request = Net::HTTP::Get.new(@path, headers)
    request.basic_auth(login, password)
    @response = http.request(request)
    self
  end

  def post(to, params = {})
    @path = URI.parse(to).to_s
    request = Net::HTTP::Post.new(@path, headers)
    request.basic_auth(login, password)
    request.body = MultiJson.encode(CentrumFaktur::Utils.normalize_params(params))
    @response = http.request(request)
    self
  end

  def put(to, params = {})
    @path = URI.parse(to).to_s
    request = Net::HTTP::Put.new(@path, headers)
    request.basic_auth(login, password)
    request.body = MultiJson.encode(CentrumFaktur::Utils.normalize_params(params))
    @response = http.request(request)
    self
  end

  def delete(to)
    @path = URI.parse(to).to_s
    request = Net::HTTP::Delete.new(@path, headers)
    request.basic_auth(login, password)
    @response = http.request(request)
    self
  end

  def parse_response
    case format.to_sym
    when :json
      response.body ? MultiJson.decode(response.body) : nil
    when :yaml
      response.body ? YAML.load(response.body) : nil
    when :xml, :pickle, :pdf
      response.body
    else
      raise StandardError.new("Unknown format: #{@format}")
    end
  end

  def handle_response
    case response.code.to_i
    when 200...300
      parse_response
    when 300...600
      raise CentrumFaktur::ResponseError.new(response)
    else
      raise StandardError.new("Unknown response code")
    end
  end

  def headers
    {"Content-Type" => "application/json", "User-Agent" => "ruby-gem-v#{CentrumFaktur::VERSION}"}
  end
end
