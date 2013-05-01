class Notificate::Notice
  include ::HTTParty

  def initialize(message, message_type)
    @defaults = { headers: { 'Content-Type' => 'application/json'} }

    case message_type
    when :application
      app_notice(message)
    when :exception
      exception_notice(message)
    end
  end

  def app_notice(payload)
    self.class.post(Notificate.request_path, payload.merge(@defaults))
  end

  def exception_notice(payload)
    self.class.post(Notificate.request_path, payload.merge(@defaults))
  end
end
