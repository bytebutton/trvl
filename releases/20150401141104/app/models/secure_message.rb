class SecureMessage < Base::VersionModel
  belongs_to :user

  after_create :notify_admin_mail
  validates :text,
            :presence => true

  private
    def notify_admin_mail
      SecureMessageMailer.delay.secure_message(self)
    end

end