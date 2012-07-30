require "centrum_faktur/api/base"

module CentrumFaktur::API
  class Customer < Base
    def list(options = {})
      request = connection.get("/api/1.0/customers/", options)
      request.handle_response
    end

    def show(customer_uri, options = {})
      request = connection.get(customer_uri, options)
      request.handle_response
    end

    def create(params)
      request = connection.post("/api/1.0/customers/", params)
      request.handle_response
    end

    def update(customer_uri, params)
      request = connection.put(customer_uri, params)
      request.handle_response
    end

    def destroy(customer_uri)
      request = connection.delete(customer_uri)
      request.handle_response
    end
  end
end
