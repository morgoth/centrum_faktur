require "centrum_faktur/version"
require "centrum_faktur/utils"
require "centrum_faktur/exceptions"
require "centrum_faktur/connection"
require "centrum_faktur/account"
require "centrum_faktur/comment"
require "centrum_faktur/customer"
require "centrum_faktur/estimate"
require "centrum_faktur/invoice"
require "centrum_faktur/user"
require "centrum_faktur/payment"

module CentrumFaktur
  API_VERSION = "1.0"

  class << self
    attr_accessor :login, :password, :subdomain

    def configure
      yield self
    end
  end
end
