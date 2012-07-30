require "centrum_faktur/api/base"

module CentrumFaktur::API
  class Comment < Base
    def list(comment_uri = "/api/1.0/comments/", options = {})
      request = connection.get(comment_uri, options)
      request.handle_response
    end

    def create(comment_uri, params)
      request = connection.post(comment_uri, params)
      request.handle_response
    end
  end
end
