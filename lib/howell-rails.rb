module Howell; end

require 'httparty'
require 'rails/version'
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
  require 'rails/configuration'
  require 'rails/railtie'

  module Howell::Rails
    extend Configuration
  end
end
