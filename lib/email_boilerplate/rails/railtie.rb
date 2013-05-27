require 'rails/railtie'

module EmailBoilerplate
  class Railtie < Rails::Railtie
    initializer 'email_boilerplate.append_template_paths' do |app|
    end
  end
end