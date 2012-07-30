# -*- encoding: utf-8 -*-
require "helper"

describe CentrumFaktur::API::Invoice do
  before do
    @client = CentrumFaktur::Client.new(login: "john", password: "secret", subdomain: "john")
  end

  it "detroys invoice" do
    FakeWeb.register_uri(:delete, "https://john:secret@john.centrumfaktur.pl/api/1.0/invoices/666/", response: fixture("destroy_invoice.txt"))
    response = CentrumFaktur::API::Invoice.new(@client).destroy("/api/1.0/invoices/666/")

    assert_equal nil, response
  end

  it "raises error when invoice does not exist" do
    FakeWeb.register_uri(:delete, "https://john:secret@john.centrumfaktur.pl/api/1.0/invoices/666/", response: fixture("destroy_invoice_404.txt"))

    assert_raises CentrumFaktur::ResponseError do
      CentrumFaktur::API::Invoice.new(@client).destroy("/api/1.0/invoices/666/")
    end
  end
end
