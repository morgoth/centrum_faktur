class CentrumFaktur::Customer
  def self.list(options = {})
    request = CentrumFaktur::Connection.new.get("/api/1.0/customers/", options)
    request.handle_response
  end

  def self.show(customer_uri, options = {})
    request = CentrumFaktur::Connection.new.get(customer_uri, options)
    request.handle_response
  end

  def self.create(params)
    request = CentrumFaktur::Connection.new.post("/api/1.0/customers/", params)
    request.handle_response
  end

  def self.update(customer_uri, params)
    request = CentrumFaktur::Connection.new.put(customer_uri, params)
    request.handle_response
  end

  def self.destroy(customer_uri)
    request = CentrumFaktur::Connection.new.delete(customer_uri)
    request.handle_response
  end
end
