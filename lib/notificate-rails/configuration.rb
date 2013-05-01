module Notificate::Rails::Configuration
  attr_reader :options

  def configure(opts = {})
    @options = Notificate::ObjectifiedHash.new(opts)
  end
end
