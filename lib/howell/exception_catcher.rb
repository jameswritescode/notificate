module Howell::ExceptionCatcher
  def self.notify(exception, data)
    payload = { body: { payload: { exception: exception, data: data } }.to_json }

    ::Howell::Notice.new(payload, :exception)
  end
end
