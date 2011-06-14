class CentrumFaktur::Invoice
  def self.list(options = {})
    request = CentrumFaktur::Connection.new.get("/api/1.0/invoices/", options)
    request.handle_response
  end

  def self.list_updates(options = {})
    request = CentrumFaktur::Connection.new.get("/api/1.0/invoices/updates/", options)
    request.handle_response
  end

  def self.show(invoice_uri, options = {})
    request = CentrumFaktur::Connection.new.get(invoice_uri, options)
    request.handle_response
  end

  def self.create(params)
    request = CentrumFaktur::Connection.new.post("/api/1.0/invoices/", params)
    request.handle_response
  end

  def self.destroy(invoice_uri)
    request = CentrumFaktur::Connection.new.delete(invoice_uri)
    request.handle_response
  end
end
