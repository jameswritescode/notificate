module Notificate::Rails::Controller
  def self.included(klass)
    klass.extend ControllerMethods
  end

  def rails_data
    {
      environment: ::Notificate::Rails.options.environment,
      root:        ::Notificate::Rails.options.project_root
    }
  end

  def notify_notificate(exception)
    ::Notificate::ExceptionCatcher.notify(exception, rails_data)
  end

  def _notificate_around_filter
    begin
      yield
    rescue Object => error
      handler = error.respond_to?(:original_exception) ? error.original_exception : error

      notify_notificate(error) unless handler_for_rescue(handler)

      raise
    end
  end

  module ControllerMethods
    def enable_notificate_notifications(options = {})
      prepend_around_filter :_notificate_around_filter, options
    end
  end
end
