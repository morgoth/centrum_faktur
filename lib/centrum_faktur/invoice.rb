class CentrumFaktur::Invoice
  class << self
    def list(options = {})
      request = CentrumFaktur::Connection.new.get("/api/1.0/invoices/", options)
      request.handle_response
    end

    def list_updates(options = {})
      request = CentrumFaktur::Connection.new.get("/api/1.0/invoices/updates/", options)
      request.handle_response
    end

    def show(invoice_uri, options = {})
      request = CentrumFaktur::Connection.new.get(invoice_uri, options)
      request.handle_response
    end

    def create(params)
      request = CentrumFaktur::Connection.new.post("/api/1.0/invoices/", params)
      request.handle_response
    end

    def update(invoice_uri, params)
      request = CentrumFaktur::Connection.new.put(invoice_uri, params)
      request.handle_response
    end

    def destroy(invoice_uri)
      request = CentrumFaktur::Connection.new.delete(invoice_uri)
      request.handle_response
    end
  end
end
