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

This template also exposes an optional pattern for nesting an application's secondary email layout. To nest a custom layout, (1) set the layout in the mailer class, and (2) wrap the layout's content and `yield` statement in a `content_for` key for `:body`.

**some_mailer.rb  
    class SomeMailer < ActionMailer::EmailBoilerplate
      layout 'some/custom/layout'  
    end

**some/custom/layout.html.erb  
    <% content_for :body do %>
      <h1>title</h1>
      <p>email body</p>
      <%= yield %>
    <% end %>
    <%= render :template => 'boilerplate' %> 

