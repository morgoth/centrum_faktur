require "centrum_faktur/api/base"

module CentrumFaktur::API
  class User < Base
    def list(options = {})
      request = connection.get("/api/1.0/users/", options)
      request.handle_response
    end
  end
end
