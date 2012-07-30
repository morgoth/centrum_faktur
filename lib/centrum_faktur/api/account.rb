require "centrum_faktur/api/base"

module CentrumFaktur::API
  class Account < Base
    def list(options = {})
      request = connection.get("/api/1.0/accounts/", options)
      request.handle_response
    end
  end
end
