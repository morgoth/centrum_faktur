require "centrum_faktur/api/base"

module CentrumFaktur::API
  class Base
    attr_reader :client

    def initialize(client)
      @client = client
    end

    private

    def connection
      CentrumFaktur::Connection.new(client)
    end
  end
end
