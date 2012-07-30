# -*- encoding: utf-8 -*-
require "helper"

describe CentrumFaktur::API::Customer do
  before do
    @client = CentrumFaktur::Client.new(login: "john", password: "secret", subdomain: "john")
  end

  it "returns customers list" do
    FakeWeb.register_uri(:get, "https://john:secret@john.centrumfaktur.pl/api/1.0/customers/", response: fixture("customers.txt"))
    response = CentrumFaktur::API::Customer.new(@client).list
    expected = [{"name"=>"Stefan Stefański", "contact"=>"", "address"=>"Stefanowo\r\nul. Stefańska 1", "resource_uri"=>"/api/1.0/customers/3138/", "email"=>"w.wnetrzak+stefan@gmail.com", "tax_id"=>""}]

    assert_equal expected, response
  end
end
