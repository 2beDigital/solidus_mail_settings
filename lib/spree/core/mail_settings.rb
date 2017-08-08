module Spree
  module Core
    class MailSettings
      MAIL_AUTH = %w(None plain login cram_md5).freeze
      SECURE_CONNECTION_TYPES = %w(None SSL TLS).freeze

      # Override the Rails application mail settings based on preferences
      # This makes it possible to configure the mail settings through an admin
      # interface instead of requiring changes to the Rails envrionment file
      def self.init
        ActionMailer::Base.delivery_method = preferred_delivery_method
        ActionMailer::Base.default_url_options[:host] ||= Spree::Store.current(nil) if Spree::Store.table_exists?
      end

      def mail_server_settings
        settings = if need_authentication?
                     basic_settings.merge(user_credentials)
                   else
                     basic_settings
                   end

        settings.merge enable_starttls_auto: secure_connection?
      end

      class << self
        private

        def preferred_delivery_method
          Rails.application.config.action_mailer.delivery_method || :spree
        end
      end

      private

      def user_credentials
        {
          user_name: Spree::Backend::Config.smtp_username,
          password: Spree::Backend::Config.smtp_password
        }
      end

      def basic_settings
        {
          address: Spree::Backend::Config.mail_host,
          domain: Spree::Backend::Config.mail_domain,
          port: Spree::Backend::Config.mail_port,
          authentication: Spree::Backend::Config.mail_auth_type
        }
      end

      def need_authentication?
        Spree::Backend::Config.mail_auth_type != 'None'
      end

      def secure_connection?
        Spree::Backend::Config.secure_connection_type == 'TLS'
      end
    end
  end
end
