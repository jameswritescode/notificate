module Howell::Configuration
  attr_reader :options

  def configure(opts = {})
    opts[:protocol] ||= :https
    opts[:port]     ||= 80

    @options = Howell::ObjectifiedHash.new(opts)
  end

  def request_path
    "#{options.protocol}://#{options.hostname}:#{options.port}/#{options.endpoint}#{options.params}"
  end
end
