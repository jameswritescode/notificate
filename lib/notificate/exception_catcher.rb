module Notificate::ExceptionCatcher
  def self.notify(exception, data)
    payload = { body: { payload: { exception: exception.to_s, data: data } }.to_json }

    ::Notificate::Notice.new(payload, :exception)
  end
end
