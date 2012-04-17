class CentrumFaktur::Account
  class << self
    def list(options = {})
      request = CentrumFaktur::Connection.new.get("/api/1.0/accounts/", options)
      request.handle_response
    end
  end
end
