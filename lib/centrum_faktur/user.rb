class CentrumFaktur::User
  def self.list(options = {})
    request = CentrumFaktur::Request.new.get("/api/1.0/users/", options)
    request.handle_response
  end
end
