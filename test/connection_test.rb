require "helper"

describe CentrumFaktur::Connection do
  before do
    CentrumFaktur.configure do |config|
      config.login     = "fake"
      config.password  = "fake"
      config.subdomain = "fake"
    end
  end

  it "returns url to custom profile" do
    assert_equal "https://fake.centrumfaktur.pl", CentrumFaktur::Connection.new.uri.to_s
  end
end
