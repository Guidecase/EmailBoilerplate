require 'ansi/code'
require 'turn'
require 'minitest/autorun'
require 'ostruct'
require_relative '../lib/email_boilerplate'

class MockMailer < ActionMailer::EmailBoilerplate::Mailer
  def example_email(locale, config)
    @config = config

    mail locale, :to => default_recipient,
                 :from => default_sender,
                 :subject => 'test',
                 :template_name => 'example_email'
  end
end
MockMailer.append_view_path(File.expand_path("../views", __FILE__))

module ActionMailer
  class Base
    def default_url_options; {}; end
  end
end
ActionMailer::Base.delivery_method = :test