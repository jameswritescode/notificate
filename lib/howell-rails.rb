module Howell; end

require 'httparty'
require 'howell-rails/version'
require 'howell/objectified_hash'
require 'howell/configuration'
require 'howell/notice'
require 'howell/exception_catcher'

module Howell
  extend Configuration

  def self.notice(message)
    payload = { body: { payload: { message: message } } }

    Notice.new(payload, :application)
  end
end

if defined?(Rails)
  require 'howell-rails/configuration'
  require 'howell-rails/railtie'

  module Howell::Rails
    extend Configuration
  end
end
