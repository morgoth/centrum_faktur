require "helper"

describe "Configuration" do
  it "should allow to set custom settings" do
    CentrumFaktur.configure do |config|
      config.login     = "john"
      config.password  = "secret"
      config.subdomain = "john-doe"
    end

    assert_equal "john", CentrumFaktur.login
    assert_equal "secret", CentrumFaktur.password
    assert_equal "john-doe", CentrumFaktur.subdomain
  end
end
