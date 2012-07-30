require "centrum_faktur/api/base"

module CentrumFaktur::API
  class Estimate < Base
    def list(options = {})
      request = connection.get("/api/1.0/estimates/", options)
      request.handle_response
    end

    def list_updates(options = {})
      request = connection.get("/api/1.0/estimates/updates/", options)
      request.handle_response
    end

    def show(estimate_uri, options = {})
      request = connection.get(estimate_uri, options)
      request.handle_response
    end

    def create(params)
      request = connection.post("/api/1.0/estimates/", params)
      request.handle_response
    end

    def update(estimate_uri, params)
      request = connection.put(estimate_uri, params)
      request.handle_response
    end

    def destroy(estimate_uri)
      request = connection.delete(estimate_uri)
      request.handle_response
    end
  end
end
