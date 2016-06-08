class RequestCallback < Base::VersionModel
  belongs_to :user

  after_create :notify_admin_mail
  validates :phone,
            :presence => true

  private
    def notify_admin_mail
      RequestCallbackMailer.delay.request_callback(self)
    end

end