# -*- encoding: utf-8 -*-
require "helper"

describe CentrumFaktur::API::User do
  before do
    @client = CentrumFaktur::Client.new(login: "john", password: "secret", subdomain: "john")
  end

  it "returns users list" do
    FakeWeb.register_uri(:get, "https://john:secret@john.centrumfaktur.pl/api/1.0/users/", response: fixture("users.txt"))
    response = CentrumFaktur::API::User.new(@client).list
    expected = [{
      "login"        => "morgoth",
      "first_name"   => "Wojciech",
      "last_name"    => "Wnętrzak",
      "email"        => "w.wnetrzak@gmail.com",
      "resource_uri" => "/api/1.0/users/749/"
    }]

    assert_equal expected, response
  end
end
