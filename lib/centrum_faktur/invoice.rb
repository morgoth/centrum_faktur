class CentrumFaktur::Invoice
  def self.list(options = {})
    request = CentrumFaktur::Request.new.get("/api/1.0/invoices/", options)
    request.handle_response
  end

  def self.list_updates(options = {})
    request = CentrumFaktur::Request.new.get("/api/1.0/invoices/updates/", options)
    request.handle_response
  end

  def self.show(invoice_uri, options = {})
    request = CentrumFaktur::Request.new.get(invoice_uri, options)
    request.handle_response
  end

  def self.create(params)
    request = CentrumFaktur::Request.new.post("/api/1.0/invoices/", params)
    request.handle_response
  end

  def self.destroy(invoice_uri)
    request = CentrumFaktur::Request.new.delete(invoice_uri)
    request.handle_response
  end
end
