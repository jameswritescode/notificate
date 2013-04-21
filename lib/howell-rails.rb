module Howell; end

require 'httparty'
require 'howell-rails/version'
require 'howell/objectified_hash'
require 'howell/configuration'
require 'howell/notice'

module Howell
  extend Configuration

  def self.notice(message)
    payload = { body: { payload: { message: message } } }

    Notice.new(payload, :application)
  end
end
