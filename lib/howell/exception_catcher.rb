module Howell::ExceptionCatcher
  def self.notify(exception, data)
    payload = { body: { payload: { exception: exception, data: data } } }

    ::Howell::Notice.exception_notice(payload)
  end
end
