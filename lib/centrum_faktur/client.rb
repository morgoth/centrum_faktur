module CentrumFaktur
  class Client
    attr_reader :login, :password, :subdomain

    def initialize(configuration = {})
      @login     = configuration[:login]     || raise(ArgumentError.new("You must specify login"))
      @password  = configuration[:password]  || raise(ArgumentError.new("You must specify password"))
      @subdomain = configuration[:subdomain] || raise(ArgumentError.new("You must specify subdomain"))
    end

    def account
      API::Account.new(self)
    end

    def comment
      API::Comment.new(self)
    end

    def customer
      API::Customer.new(self)
    end

    def estimate
      API::Estimate.new(self)
    end

    def invoice
      API::Invoice.new(self)
    end

    def payment
      API::Payment.new(self)
    end

    def user
      API::User.new(self)
    end
  end
end
