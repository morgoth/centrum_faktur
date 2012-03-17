require "helper"

describe "Payment" do
  before do
    CentrumFaktur.configure do |config|
      config.login = "john"
      config.password = "secret"
      config.subdomain = "john"
    end
  end
  
  it "should get payment" do
    FakeWeb.register_uri(:get, 
      "https://john:secret@john.centrumfaktur.pl/api/1.0/invoices/22933/payments", 
      :response => fixture("payments.txt")
    )
    response = CentrumFaktur::Payment.list("/api/1.0/invoices/22933/payments")
    expected = [{
      "date" => "2007-01-01", "amount" => 10.0, "resource_uri" => "/api/1.0/users/749/",
      "created" => "2011-06-14 20:06:36"
    }]
    
    assert_equal expected, response
  end
  
  it "should create payment" do
    FakeWeb.register_uri(:post, "https://john:secret@john.centrumfaktur.pl/api/1.0/invoices/22933/payments", :response => fixture("new_payment.txt"))
    response = CentrumFaktur::Payment.create("/api/1.0/invoices/22933/payments", 
      {:date => "2011-06-10", :amount => 99.00}
    )
    
    expected = {"date"=>"2011-06-10",
      "amount" => 99.00, "created" => "2012-01-01", "resource_uri"=>"/api/1.0/payments/99999/"
    }
    assert_equal expected, response
  end
end
