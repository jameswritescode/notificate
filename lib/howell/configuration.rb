module Howell::Rails::Configuration
  attr_reader :options

  def configure(opts = {})
    @options = Howell::Rails::ObjectifiedHash.new(opts)
  end
end
