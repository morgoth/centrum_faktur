# -*- encoding: utf-8 -*-
require "helper"

describe CentrumFaktur::API::Comment do
  before do
    @client = CentrumFaktur::Client.new(login: "john", password: "secret", subdomain: "john")
  end

  it "returns estimate comments list limited to one" do
    FakeWeb.register_uri(:get, "https://john:secret@john.centrumfaktur.pl/api/1.0/estimates/14587/comments/?limit=1", :response => fixture("comments.txt"))
    response = CentrumFaktur::API::Comment.new(@client).list("/api/1.0/estimates/14587/comments/", :limit => 1)
    expected = [{"body"=>"cool", "user_uri"=>"/api/1.0/users/749/", "comment_type"=>"user", "created"=>"2011-06-14 20:06:36", "commented_object_type"=>"estimate", "commented_object_uri"=>"/api/1.0/estimates/20527/", "is_public"=>false}]

    assert_equal expected, response
  end

  it "creates comment" do
    FakeWeb.register_uri(:post, "https://john:secret@john.centrumfaktur.pl/api/1.0/estimates/14587/comments/", :response => fixture("new_comment.txt"))
    response = CentrumFaktur::API::Comment.new(@client).create("/api/1.0/estimates/14587/comments/", {:body => "cool", :is_public => false})
    expected = {"body"=>"thanks", "user_uri"=>"/api/1.0/users/749/", "comment_type"=>"user", "created"=>"2011-06-16 21:55:03", "commented_object_type"=>"estimate", "commented_object_uri"=>"/api/1.0/estimates/20627/", "is_public"=>false}

    assert_equal expected, response
  end
end
