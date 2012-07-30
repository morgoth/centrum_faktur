# Centrum Faktur

Ruby client for [Centrum Faktur API](http://centrumfaktur.pl/api/)

## Installation

```
gem install centrum_faktur
```
## Usage

Request returns Array or Hash, where keys are strings.
When other format than `json` (default) or `yaml` is specified, response is not parsed.
So for `xml` and `pickle` requests, string is returned.

```ruby
require "centrum_faktur"
client = CentrumFaktur::Client.new(login: "your_login", password: "your-password", subdomain: "your-subodomain")
```

``` ruby
client.invoice.show("/api/1.0/invoices/1/", format: :xml)
```

Writing invoice to pdf can be done as follows:

``` ruby
File.open("my-invoice.pdf", "w") { |file| file.write(client.invoice.show("/api/1.0/invoices/1/", format: :pdf)) }
```

All params that respond to `strftime` (i.e. Date, Time) will be normalized to format
required by API, that is: `"YYYY-MM-DD"`

### Account

Only listing accounts is supported via API

``` ruby
client.account.list
```

### Comment

Listing all comments:

``` ruby
client.comment.list
```

Or listing comments for given resource:

``` ruby
client.comment.list("/api/1.0/estimates/1/comments/")
```

Creating comment:

You must pass path to resource comment and required attributes:

``` ruby
client.comment.create("/api/1.0/estimates/1/comments/", {body: "cool", is_public: false})
```

### Estimate

Listing all estimates:

``` ruby
client.estimate.list
```

Monitoring estimate changes (with optional filter param):

``` ruby
client.estimate.list_updates(updated_since: "2012-01-12")
```

Creating estimate (check required attributes in API description):

``` ruby
client.estimate.create({})
```

Updating estimate:

``` ruby
client.estimate.update("/api/1.0/estimates/1/", {})
```

Removing estimate:

``` ruby
client.estimate.destroy("/api/1.0/estimates/1/")
```

### Invoice

Listing all invoices:

``` ruby
client.invoice.list
```

Monitoring invoice changes:

``` ruby
client.invoice.list_updates
```

Displaying invoice:

``` ruby
client.invoice.show("/api/1.0/invoices/1/")
```

Creating invoice (check required attributes in API description):

``` ruby
client.invoice.create({})
```

Updating invoice:

``` ruby
client.invoice.update("/api/1.0/invoices/1/", {})
```

Removing invoice:

``` ruby
client.invoice.destroy("/api/1.0/invoices/1/")
```

### User ###

Only listing users is supported via API

``` ruby
client.user.list
```

## Continuous Integration
[![Build Status](https://secure.travis-ci.org/morgoth/centrum_faktur.png)](http://travis-ci.org/morgoth/centrum_faktur)

## Copyright

Created during development for [Ragnarson](http://ragnarson.com/)

Copyright © Wojciech Wnętrzak. See LICENSE for details.
