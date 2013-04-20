module Howell::Configuration
  attr_reader :options

  def configure(opts = {})
    @options = Howell::ObjectifiedHash.new(opts)
  end

  def request_path
    "#{options.protocol}://#{options.hostname}:#{options.port}/#{options.endpoint}#{options.params}"
  end
end
