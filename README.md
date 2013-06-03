# Email Boilerplate

This Gem provides email templates and view helpers for normalizing HTML emails in common clients based on the work of the HTML Email Boilerplate: 

http://htmlemailboilerplate.com/

Mailer Class
=============

Inherit from the mailer class to use the boilerplate layout and give your mailer views access to additional helpers.

    class SomeMailer < ActionMailer::EmailBoilerplate
      ...
    end

Mailer Layout
=============    

The boilerplate providers an html email template that will be used as the default layout whenever a mailer inherits from `ActionMailer::EmailBoilerplate`. 

This template also exposes an optional pattern for nesting an application's secondary email layout. To nest a custom layout, (1) set the layout in the mailer class, (2) in the custom layout wrap a yield to the mailer content in a `content_for` block for the key `:body`, (3) wrap the mail's content in a `content_for` block for the custom layout.

**1. some_mailer.rb  
    class SomeMailer < ActionMailer::EmailBoilerplate
      layout 'some/custom/layout'  
    end

**2. some/custom/layout.html.erb  
    <% content_for :body do %>
      <div style='background-color:#eee'>
        <%= yield(:some_mailer_body) %>
      </div>
    <% end %>
    <%= render :template => 'boilerplate' %> 

**3. views/mailers/some_mailer/some_mail.rb  
  <% content_for :some_mailer_body do %>
    <p>Example email body text.</p>
  <% end %>


Rails Configuration
=============    

In order to send emails the mailer template must be configured with a default to and from address. In `application.rb` add the following configuration settings:

    class Application < Rails::Application
      config.email_from_address = 'sender@example.com'
      config.email_to_address = 'info@example.com'
    end