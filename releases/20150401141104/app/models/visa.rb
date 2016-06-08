class Visa < Base::VersionModel

  include ExpirationValidation

  has_many   :trips,     :dependent => :nullify
  has_one    :cron_visa, :dependent => :destroy
  belongs_to :user
  belongs_to :verified_admin, :class_name => 'User'
  belongs_to :country
  belongs_to :visa_entry
  belongs_to :purpose

  mount_uploader :scan, ImageUploader

  scope :available_visas, -> (country_id, purpose_id, start_date, end_date) do
    where('country_id = ? AND purpose_id = ? AND valid_from <= ? AND expires_on >= ?', country_id, purpose_id, start_date.to_date, end_date.to_date).order('expires_on ASC').to_a
  end

  validates :country,
            :purpose,
            :number,
            :visa_entry,
            :valid_from,
            :expires_on,
            :presence => true

  validates :number,
            :length => { :minimum => 4 },
            :uniqueness => true

  after_create :notify_user_mail
  after_update :verify_user_mail
  after_update { self.cron_visa.andand.destroy }

  def become_certified?
    is_certified_changed? && certified?
  end

  def has_blank_entry?
    visa_entry.entry_count.nil? || trips.count < visa_entry.entry_count
  end

  def free_entries
    has_blank_entry? ? self : nil
  end

  def certified?
    is_certified
  end

  private

    def notify_user_mail
      User.current_user.admin? ? VisaMailer.delay.admin_create_visa(self) : VisaMailer.delay.user_create_visa(self)
    end

    def verify_user_mail
      VisaMailer.delay.visa_was_verified(self) if become_certified?
    end

end
