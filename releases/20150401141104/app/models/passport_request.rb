class PassportRequest < Base::VersionModel

  belongs_to :user
  belongs_to :trip

  after_create  :send_passport_assistance_mail

  def need_assistance?
    is_assistance
  end

  def doesnt_have_blank_pages?
    !have_blank_pages
  end

  def damaged?
    !is_intact
  end

  def processed?
    is_processed
  end

  private

    def send_passport_assistance_mail
      UserMailer.delay.passport_assistance(self) if need_assistance?
    end


end
