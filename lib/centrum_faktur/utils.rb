require "uri"

module CentrumFaktur::Utils
  def inline_params(params)
    params.map { |k, v| "#{k}=#{v}" }.join("&")
  end

  def path_with_params(path, params)
    path = path + "?" + inline_params(params) unless params.empty?
    URI.parse(path).to_s
  end

  def normalize_params(params)
    raise ArgumentError.new("Only hash params can be normalized") unless params.kind_of?(Hash)
    params.inject({}) do |normalized, (key, value)|
      normalized[key] =
        if value.kind_of?(Hash)
          normalize_params(value)
        elsif value.kind_of?(Array)
          value.map { |v| v.kind_of?(Hash) ? normalize_params(v) : normalize_value(v) }
        else
          normalize_value(value)
        end
      normalized
    end
  end

  def normalize_value(value)
    value.respond_to?(:strftime) ? value.strftime("%Y-%m-%d") : value
  end

  module_function :inline_params, :path_with_params, :normalize_params, :normalize_value
end
