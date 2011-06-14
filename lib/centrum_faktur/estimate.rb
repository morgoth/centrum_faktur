class CentrumFaktur::Estimate
  def self.list(options = {})
    request = CentrumFaktur::Connection.new.get("/api/1.0/estimates/", options)
    request.handle_response
  end

  def self.list_updates(options = {})
    request = CentrumFaktur::Connection.new.get("/api/1.0/estimates/updates/", options)
    request.handle_response
  end

  def self.show(estimate_uri, options = {})
    request = CentrumFaktur::Connection.new.get(estimate_uri, options)
    request.handle_response
  end

  def self.create(params)
    request = CentrumFaktur::Connection.new.post("/api/1.0/estimates/", params)
    request.handle_response
  end

  def self.update(estimate_uri, params)
    request = CentrumFaktur::Connection.new.put(estimate_uri, params)
    request.handle_response
  end

  def self.destroy(estimate_uri)
    request = CentrumFaktur::Connection.new.delete(estimate_uri)
    request.handle_response
  end
end
