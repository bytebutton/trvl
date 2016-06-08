module MailerSettings
  extend ActiveSupport::Concern

  included do
    layout 'mailer/plg_team'

    before_action do
      ActionMailer::Base.delivery_method = Settings.delivery_method.to_sym
      #ActionMailer::Base.smtp_settings   = Settings.action_mailer.smtp_settings.to_hash
      ActionMailer::Base.smtp_settings = {
          :address        => Setting.smtp_settings_address,
          :port           => Setting.smtp_settings_port.to_i,
          :authentication => Setting.smtp_settings_authentication.to_sym,
          :user_name      => Setting.smtp_settings_user_name,
          :password       => Setting.smtp_settings_password,
          :enable_starttls_auto => Setting.smtp_settings_enable_starttls_auto
      }
    end

    default :from => Proc.new { "#{Setting.from_email_name} <#{Setting.from_email}>" },
            :to   => Proc.new { "#{Setting.to_email_name} <#{Setting.to_email}>" }
  end
end
