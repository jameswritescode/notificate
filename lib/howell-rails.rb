module Howell; end

require 'json'
require 'httparty'
require 'howell-rails/version'
require 'howell/objectified_hash'
require 'howell/configuration'
require 'howell/notice'
require 'howell/exception_catcher'

module Howell
  extend Configuration

  def self.notice(message)
    payload = { body: { payload: { message: message }.to_json } }

    Notice.new(payload, :application)
  end
end

if defined?(Rails)
  require 'howell-rails/configuration'
  require 'howell-rails/railtie'
  require 'howell-rails/controller'

  module Howell::Rails
    extend Configuration

    include Controller
  end
end
