# -*- encoding: utf-8 -*-
require "helper"

describe CentrumFaktur::Invoice do
  before do
    CentrumFaktur.configure do |config|
      config.login     = "john"
      config.password  = "secret"
      config.subdomain = "john"
    end
  end

  it "detroys invoice" do
    FakeWeb.register_uri(:delete, "https://john:secret@john.centrumfaktur.pl/api/1.0/invoices/666/", :response => fixture("destroy_invoice.txt"))
    response = CentrumFaktur::Invoice.destroy("/api/1.0/invoices/666/")

    assert_equal nil, response
  end

  it "raises error when invoice does not exist" do
    FakeWeb.register_uri(:delete, "https://john:secret@john.centrumfaktur.pl/api/1.0/invoices/666/", :response => fixture("destroy_invoice_404.txt"))

    assert_raises CentrumFaktur::ResponseError do
      CentrumFaktur::Invoice.destroy("/api/1.0/invoices/666/")
    end
  end
end
