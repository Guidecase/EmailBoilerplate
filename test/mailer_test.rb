require_relative 'test_helper'

class MailerTest < MiniTest::Unit::TestCase
  def setup
    @mailer = MockMailer.send :new

    @config ||= OpenStruct.new :email_from_address => 'from@example.com',
                               :email_to_address => 'to@example.com'
    @mailer.instance_variable_set('@config', @config)
  end

  def teardown
    ActionMailer::Base.deliveries.clear
  end

  def test_default_recipient
    assert_equal @config.email_to_address, @mailer.default_recipient
  end  

  def test_default_sender
    from = @config.email_from_address
    assert_equal "#{from} <#{from}>", @mailer.default_sender
  end  

  def test_default_sender_with_email_address
    email = 'test@example.com'
    from = @config.email_from_address
    assert_equal "#{email} <#{from}>", @mailer.default_sender(email)
  end  

  def test_that_mail_is_sent
    mail = MockMailer.example_email 'en', @config
    mail.deliver
    assert !ActionMailer::Base.deliveries.empty?
  end

  def test_that_boilerplate_layout_is_used
    mail = MockMailer.example_email 'en', @config
    delivery = mail.deliver

    assert_match /<h1>test<\/h1>/, delivery.encoded
    assert_match /<body style='margin:0;padding:0'>/, delivery.encoded
  end

  def test_set_default_url_locale
    assert @mailer.send :set_default_url_locale, 'fr'
  end
end