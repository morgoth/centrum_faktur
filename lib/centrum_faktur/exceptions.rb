class CentrumFaktur::ResponseError < StandardError
  attr_reader :response

  def initialize(response)
    @response = response
    super("HTTP CODE: #{@response.code}: #{@response.body}")
  end
end
