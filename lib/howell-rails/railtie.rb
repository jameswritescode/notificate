class Howell::Rails::Railtie < Rails::Railtie
  initializer 'howell.configure_rails_initialization' do |app|
    Howell::Rails.configure(
      environment:  Rails.env.to_s,
      project_root: Rails.root.to_s
    )

    if app.respond_to?(:config) and app.config.respond_to?(:middleware)
      require 'howell-rails/rack'

      if defined?(ActionDispatch::DebugExceptions)
        app.config.middleware.insert_after ActionDispatch::DebugExceptions, Howell::Rails::Rack
      elsif defined?(ActionDispatch::ShowExceptions)
        app.config.middleware.insert_after ActionDispatch::ShowExceptions, Howell::Rails::Rack
      else
        app.config.middleware.insert 0, Howell::Rails::Rack
      end
    end
  end
end
