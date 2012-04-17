require "helper"

describe CentrumFaktur::Utils do
  it "converts params to inline style" do
    params = CentrumFaktur::Utils.inline_params({:offset => 2, :limit => 10})

    assert_equal "offset=2&limit=10", params
  end

  it "converts params to inline style with path" do
    path = CentrumFaktur::Utils.path_with_params("/api/1.0/invoices/", {:offset => 2, :limit => 10})

    assert_equal "/api/1.0/invoices/?offset=2&limit=10", path.to_s
  end

  it "returns path when no params provided" do
    path = CentrumFaktur::Utils.path_with_params("/api/1.0/invoices/", {})

    assert_equal "/api/1.0/invoices/", path.to_s
  end

  it "normalizes date to required format" do
    normalized = CentrumFaktur::Utils.normalize_value(Time.mktime(2012, 01, 01))

    assert_equal "2012-01-01", normalized
  end

  it "does not normalize not Date values" do
    normalized = CentrumFaktur::Utils.normalize_value("value")

    assert_equal "value", normalized
  end

  it "normalizes params hash" do
    params = {:body => "value", :date => Time.mktime(2012, 01, 01)}
    normalized = CentrumFaktur::Utils.normalize_params(params)

    assert_equal({:body => "value", :date => "2012-01-01"}, normalized)
  end

  it "normalizes nested params hash" do
    params = {:body => "value", :nested => {:date => Time.mktime(2012, 01, 01)}}
    normalized = CentrumFaktur::Utils.normalize_params(params)

    assert_equal({:body => "value", :nested => {:date => "2012-01-01"}}, normalized)
  end

  it "normalizes nested array params hash" do
    params = {:body => "value", :items => [:date1 => Time.mktime(2012, 01, 01), :date2 => Time.mktime(2012, 01, 02)]}
    normalized = CentrumFaktur::Utils.normalize_params(params)

    assert_equal({:body => "value", :items => [:date1 => "2012-01-01", :date2 => "2012-01-02"]}, normalized)
  end

  it "normalizes nested array values" do
    params = {:body => "value", :items => [Time.mktime(2012, 01, 01), "value"]}
    normalized = CentrumFaktur::Utils.normalize_params(params)

    assert_equal({:body => "value", :items => ["2012-01-01", "value"]}, normalized)
  end
end
