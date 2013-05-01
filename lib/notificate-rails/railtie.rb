class Notificate::Rails::Railtie < Rails::Railtie
  initializer 'notificate.configure_rails_initialization' do |app|
    Notificate::Rails.configure(
      environment:  Rails.env.to_s,
      project_root: Rails.root.to_s
    )

    if app.respond_to?(:config) and app.config.respond_to?(:middleware)
      require 'notificate-rails/rack'

      if defined?(ActionDispatch::DebugExceptions)
        app.config.middleware.insert_after ActionDispatch::DebugExceptions, Notificate::Rails::Rack
      elsif defined?(ActionDispatch::ShowExceptions)
        app.config.middleware.insert_after ActionDispatch::ShowExceptions, Notificate::Rails::Rack
      else
        app.config.middleware.insert 0, Notificate::Rails::Rack
      end
    end
  end
end
