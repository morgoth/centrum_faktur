# Centrum Faktur #

Ruby client for [Centrum Faktur API](http://centrumfaktur.pl/api/)

## Configuration ##

``` ruby
require "centrum_faktur"

CentrumFaktur.configure do |config|
  config.login     = "your_login"
  config.subdomain = "your-subdomain"
  config.password  = "your-password"
end
```

## Copyright ##

Created during development for [Ragnarson](http://ragnarson.com/)

Copyright © 2011 Wojciech Wnętrzak. See LICENSE for details.
