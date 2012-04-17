class CentrumFaktur::Estimate
  class << self
    def list(options = {})
      request = CentrumFaktur::Connection.new.get("/api/1.0/estimates/", options)
      request.handle_response
    end

    def list_updates(options = {})
      request = CentrumFaktur::Connection.new.get("/api/1.0/estimates/updates/", options)
      request.handle_response
    end

    def show(estimate_uri, options = {})
      request = CentrumFaktur::Connection.new.get(estimate_uri, options)
      request.handle_response
    end

    def create(params)
      request = CentrumFaktur::Connection.new.post("/api/1.0/estimates/", params)
      request.handle_response
    end

    def update(estimate_uri, params)
      request = CentrumFaktur::Connection.new.put(estimate_uri, params)
      request.handle_response
    end

    def destroy(estimate_uri)
      request = CentrumFaktur::Connection.new.delete(estimate_uri)
      request.handle_response
    end
  end
end
