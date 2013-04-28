module Howell::Rails
  class Rack
    def initalize(app)
      @app = app
    end

    def call(env)
      @env = env

      begin
        result = @app.call(env)
      rescue ::Exception => ex
        @env['howell.notified'] = ::Howell::ExceptionCatcher.notify(ex, rack_data)

        raise ex
      end

      result
    end

    def rack_data
      {
        environment: ::Howell::Rails.options.environment,
        root: ::Howell::Rails.options.project_root
      }
    end
  end
end
