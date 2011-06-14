require "minitest/autorun"
require "fakeweb"

require "centrum_faktur"

class MiniTest::Unit::TestCase
  def setup
    FakeWeb.allow_net_connect = false
  end
end
