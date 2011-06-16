require "minitest/autorun"
require "fakeweb"

require "centrum_faktur"

class MiniTest::Unit::TestCase
  def setup
    FakeWeb.allow_net_connect = false
  end

  # Recording response is as simple as writing in terminal:
  # curl -isu login:password 'https://subdomain.centrumfaktur.pl/api/1.0/customers/' -X GET > test/fixtures/customers.txt
  def fixture(filename)
    File.read(File.join("test", "fixtures", filename))
  end
end
