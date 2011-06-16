# Centrum Faktur #

Ruby client for [Centrum Faktur API](http://centrumfaktur.pl/api/)

## Installation ##

```
gem install centrum_faktur
```

## Configuration ##

``` ruby
require "centrum_faktur"

CentrumFaktur.configure do |config|
  config.login     = "your_login"
  config.subdomain = "your-subdomain"
  config.password  = "your-password"
end
```

## Usage ##

Requests return Array or Hash, where keys are strings.
When other format than json (default) or yaml is specified, response is not parsed.
So for xml and pickle requests string is returned.

``` ruby
CentrumFaktur::Invoice.show("/api/1.0/invoices/1/", :format => :xml)
```

Writing invoice to pdf can be done as follows:

``` ruby
File.open("my-invoice.pdf", "w") { |file| file.write(CentrumFaktur::Invoice.show("/api/1.0/invoices/1/", :format => :pdf)) }
```

All params that respond to `strftime` (i.e. Date, Time) will be normalized to format
required by API, that is: `"YYYY-MM-DD"`

### Account ###

Only listing accounts is supported via API

``` ruby
CentrumFaktur::Account.list
```

### Comment ###

Listing all comments:

``` ruby
CentrumFaktur::Comment.list
```

Or listing comments for given resource:

``` ruby
CentrumFaktur::Comment.list("/api/1.0/estimates/1/comments/")
```

Creating comment:

You must pass path to resource comment and required attributes:

``` ruby
CentrumFaktur::Comment.create("/api/1.0/estimates/1/comments/", {:body => "cool", :is_public => false})
```

### Estimate ###

Listing all estimates:

``` ruby
CentrumFaktur::Estimate.list
```

Monitoring estimate changes (with optional filter param):

``` ruby
CentrumFaktur::Estimate.list_updates(:updated_since => "2012-01-12")
```

Creating estimate (check required attributes in API description):

``` ruby
CentrumFaktur::Estimate.create({})
```

Updating estimate:

``` ruby
CentrumFaktur::Estimate.update("/api/1.0/estimates/1/", {})
```

Removing estimate:

``` ruby
CentrumFaktur::Estimate.destroy("/api/1.0/estimates/1/")
```

### Invoice ###

Listing all invoices:

``` ruby
CentrumFaktur::Invoice.list
```

Monitoring invoice changes:

``` ruby
CentrumFaktur::Invoice.list_updates
```

Displaying invoice:

``` ruby
CentrumFaktur::Invoice.show("/api/1.0/invoices/1/")
```

Creating invoice (check required attributes in API description):

``` ruby
CentrumFaktur::Invoice.create({})
```

Updating invoice:

``` ruby
CentrumFaktur::Invoice.update("/api/1.0/invoices/1/", {})
```

Removing invoice:

``` ruby
CentrumFaktur::Invoice.destroy("/api/1.0/invoices/1/")
```

### User ###

Only listing users is supported via API

``` ruby
CentrumFaktur::User.list
```

## Copyright ##

Created during development for [Ragnarson](http://ragnarson.com/)

Copyright © 2011 Wojciech Wnętrzak. See LICENSE for details.
