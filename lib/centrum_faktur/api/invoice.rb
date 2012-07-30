require "centrum_faktur/api/base"

module CentrumFaktur::API
  class Invoice < Base
    def list(options = {})
      request = connection.get("/api/1.0/invoices/", options)
      request.handle_response
    end

    def list_updates(options = {})
      request = connection.get("/api/1.0/invoices/updates/", options)
      request.handle_response
    end

    def show(invoice_uri, options = {})
      request = connection.get(invoice_uri, options)
      request.handle_response
    end

    def create(params)
      request = connection.post("/api/1.0/invoices/", params)
      request.handle_response
    end

    def update(invoice_uri, params)
      request = connection.put(invoice_uri, params)
      request.handle_response
    end

    def destroy(invoice_uri)
      request = connection.delete(invoice_uri)
      request.handle_response
    end
  end
end
