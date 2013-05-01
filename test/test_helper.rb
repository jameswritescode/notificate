require 'minitest/autorun'
require 'minitest-colorize'
require 'webmock/minitest'
require 'rails'
require 'notificate'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

def notificate_config(opts = {})
  Notificate.configure(
    protocol: opts[:protocol] || 'http',
    hostname: opts[:hostname] || 'example.com',
    endpoint: opts[:endpoint] || 'app_notices',
    params:   opts[:params]   || '?channel=zaphyous',
    port:     opts[:port]     || 1234
  )
end
