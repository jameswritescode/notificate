class Howell::Notice
  include ::HTTParty

  attr_reader :message, :message_type

  def initialize(message, message_type)
    @message, @message_type = message, message_type

    case message_type
    when :application
      app_notice(message)
    when :exception
      exception_notice(message)
    end
  end

  def app_notice(payload)
    self.class.post(Howell.request_path, payload)
  end

  def exception_notice(payload)
    self.class.post(Howell.request_path, payload)
  end
end
