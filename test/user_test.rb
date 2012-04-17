# -*- encoding: utf-8 -*-
require "helper"

describe CentrumFaktur::User do
  before do
    CentrumFaktur.configure do |config|
      config.login     = "john"
      config.password  = "secret"
      config.subdomain = "john"
    end
  end

  it "returns users list" do
    FakeWeb.register_uri(:get, "https://john:secret@john.centrumfaktur.pl/api/1.0/users/", :response => fixture("users.txt"))
    response = CentrumFaktur::User.list
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
