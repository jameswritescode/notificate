module Howell::Rails::Controller
  def self.included(klass)
    klass.extend ControllerMethods
  end

  def rails_data
    {
      environment: ::Howell::Rails.options.environment,
      root:        ::Howell::Rails.options.project_root
    }
  end

  def notify_howell(exception)
    ::Howell::ExceptionCatcher.notify(exception, rails_data)
  end

  def _howell_around_filter
    begin
      yield
    rescue Object => error
      handler = error.respond_to?(:original_exception) ? error.original_exception : error

      notify_howell(error) unless handler_for_rescue(handler)

      raise
    end
  end

  module ControllerMethods
    def enable_howell_notifications(options = {})
      prepend_around_filter :_howell_around_filter, options
    end
  end
end
