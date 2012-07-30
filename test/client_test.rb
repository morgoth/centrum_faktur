require "helper"

describe CentrumFaktur::Client do
  it "raises Argument Error when login not present" do
    assert_raises ArgumentError, /login/ do
      CentrumFaktur::Client.new(password: "secret", subdomain: "john")
    end
  end

  it "raises Argument Error when password not present" do
    assert_raises ArgumentError, /password/ do
      CentrumFaktur::Client.new(login: "john", subdomain: "john")
    end
  end

  it "raises Argument Error when subdomain not present" do
    assert_raises ArgumentError, /subdomain/ do
      CentrumFaktur::Client.new(login: "john", password: "secret")
    end
  end
end
