require "action_mailer"

module EmailBoilerplate
end

ActionMailer::Base.append_view_path(File.expand_path("../views", __FILE__))

require_relative "email_boilerplate/action_mailer/helper"
require_relative "email_boilerplate/action_mailer/mailer"
require_relative "email_boilerplate/rails/railtie"
