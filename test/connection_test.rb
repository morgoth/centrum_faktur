require "helper"

describe CentrumFaktur::Connection do
  before do
    @client = CentrumFaktur::Client.new(login: "john", password: "secret", subdomain: "john")
  end

  it "returns url to custom profile" do
    assert_equal "https://john.centrumfaktur.pl", CentrumFaktur::Connection.new(@client).uri.to_s
  end
end
