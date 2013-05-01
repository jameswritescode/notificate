module Notificate::Rails
  class Rack
    def initialize(app)
      @app = app
    end

    def call(env)
      @env = env

      begin
        result = @app.call(env)
      rescue ::Exception => ex
        @env['notificate.notified'] = ::Notificate::ExceptionCatcher.notify(ex, rack_data)

        raise ex
      end

      result
    end

    def rack_data
      {
        environment: ::Notificate::Rails.options.environment,
        root:        ::Notificate::Rails.options.project_root
      }
    end
  end
end
