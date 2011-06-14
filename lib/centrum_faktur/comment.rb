class CentrumFaktur::Comment
  def self.list(options = {})
    request = CentrumFaktur::Request.new.get("/api/1.0/comments/", options)
    request.handle_response
  end

  def self.create(params)
    request = CentrumFaktur::Request.new.post("/api/1.0/comments/", params)
    request.handle_response
  end
end
