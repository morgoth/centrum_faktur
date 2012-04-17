class CentrumFaktur::User
  class << self
    def list(options = {})
      request = CentrumFaktur::Connection.new.get("/api/1.0/users/", options)
      request.handle_response
    end
  end
end
