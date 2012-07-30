require "centrum_faktur/api/base"

module CentrumFaktur::API
  class Payment < Base
    def list(comment_uri = "/api/1.0/payments/", options = {})
      request = connection.get(comment_uri, options)
      request.handle_response
    end

    def create(payment_uri, params)
      request = connection.post(payment_uri, params)
      request.handle_response
    end
  end
end
