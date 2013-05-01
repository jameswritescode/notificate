module Notificate; end

require 'json'
require 'httparty'
require 'notificate-rails/version'
require 'notificate/objectified_hash'
require 'notificate/configuration'
require 'notificate/notice'
require 'notificate/exception_catcher'

module Notificate
  extend Configuration

  def self.notice(message)
    payload = { body: { payload: { message: message } }.to_json }

    Notice.new(payload, :application)
  end
end

if defined?(Rails)
  require 'notificate-rails/configuration'
  require 'notificate-rails/railtie'
  require 'notificate-rails/controller'

  module Notificate::Rails
    extend Configuration

    include Controller
  end
end
