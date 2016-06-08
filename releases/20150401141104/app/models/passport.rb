class Passport < Base::VersionModel

  include ExpirationValidation

  has_one    :cron_passport, :dependent => :destroy
  belongs_to :user
  belongs_to :passport_type
  belongs_to :country

  after_create :notify_admin_mail

  mount_uploader :passport_bio, ImageUploader

  validates :is_primary,
            :presence => { :message => 'You must select at least one primary passport' },
            :if => :should_be_primary?

  validates :country_id,
            :number,
            :passport_type_id,
            :valid_from,
            :expires_on,
            :presence => true

  after_save :determine_primary_passport

  after_update { self.cron_passport.andand.destroy }

  def determine_primary_passport
    user.passports.where.not({:id => id}).update_all({:is_primary => false}) if passport_become_primary?
  end

  def should_be_primary?
    user.passport.nil?
  end

  def passport_become_primary?
    is_primary_changed? && primary?
  end

  def old?
    expires_on < Date.current + 1.year
  end

  def primary?
    is_primary
  end

  private
    def notify_admin_mail
      PassportMailer.delay.user_create_passport(self)
    end

end
