class CentrumFaktur::Payment
  def self.list(comment_uri = "/api/1.0/payments/", options = {})
    request = CentrumFaktur::Connection.new.get(comment_uri, options)
    request.handle_response
  end

  def self.create(payment_uri, params)
    request = CentrumFaktur::Connection.new.post(payment_uri, params)
    request.handle_response
  end
end
