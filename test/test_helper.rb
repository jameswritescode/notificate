require 'minitest/autorun'
require 'minitest-colorize'
require 'webmock/minitest'
require 'howell-rails'

def howell_config(opts = {})
  Howell.configure(
    protocol: opts[:protocol] || 'http',
    hostname: opts[:hostname] || 'example.com',
    endpoint: opts[:endpoint] || 'app_notices',
    params:   opts[:params]   || '?channel=zaphyous',
    port:     opts[:port]     || 1234
  )
end
