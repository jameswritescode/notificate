class Howell::Rails::Railtie < Rails::Railtie
  initializer 'howell.configure_rails_initialization' do |app|
    Howell::Rails.configure(
      environment:  Rails.env.to_s,
      project_root: Rails.root.to_s
    )
  end
end
