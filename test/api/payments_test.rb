require "helper"

describe CentrumFaktur::API::Payment do
  before do
    @client = CentrumFaktur::Client.new(login: "john", password: "secret", subdomain: "john")
  end

  it "gets payment" do
    FakeWeb.register_uri(:get,
      "https://john:secret@john.centrumfaktur.pl/api/1.0/invoices/22933/payments",
      :response => fixture("payments.txt")
    )
    response = CentrumFaktur::API::Payment.new(@client).list("/api/1.0/invoices/22933/payments")
    expected = [{
      "date" => "2007-01-01", "amount" => 10.0, "resource_uri" => "/api/1.0/users/749/",
      "created" => "2011-06-14 20:06:36"
    }]

    assert_equal expected, response
  end

  it "creates payment" do
    FakeWeb.register_uri(:post, "https://john:secret@john.centrumfaktur.pl/api/1.0/invoices/22933/payments", :response => fixture("new_payment.txt"))
    response = CentrumFaktur::API::Payment.new(@client).create("/api/1.0/invoices/22933/payments",
      {:date => "2011-06-10", :amount => 99.00}
    )

    expected = {
      "date" => "2011-06-10",
      "amount" => 99.00, "created" => "2012-01-01", "resource_uri" => "/api/1.0/payments/99999/"
    }

    assert_equal expected, response
  end
end
