module ActionMailer
  module EmailBoilerplate
    class Mailer < ActionMailer::Base
      helper ActionMailer::EmailBoilerplate::Helper

      self.append_view_path File.join(__FILE__, '../../views')

      def default_sender(email=nil)
        from = config.email_from_address
        "#{email || from} <#{from}>"
      end

      def default_recipient
        config.email_to_address
      end

      def mail(locale, opts)
        ActionMailer::Base.default_url_options[:locale] = locale

        I18n.with_locale(locale) do   
          super opts
        end
      end

      private    

        def config
          @config ||= Rails.application.config
        end
    end
  end
end