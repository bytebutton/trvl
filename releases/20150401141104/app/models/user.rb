class User < Base::VersionModel

  enum :wizard_status => [:license, :change_password, :step1, :step2, :step3, :wicked_finish, :active]

  include UserKeeper

  mount_uploader :avatar,                  ImageUploader
  mount_uploader :vaccination_certificate, ImageUploader

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :async
        #:confirmable
        #:lockable
        #:timeoutable
        #:omniauthable

  has_one  :profile,                   :dependent => :destroy, :autosave => true
  has_many :trips,                     :dependent => :destroy
  has_many :visas,                     :dependent => :destroy
  has_many :passports,                 :dependent => :destroy
  has_many :secure_messages,           :dependent => :destroy
  has_many :request_callbacks,         :dependent => :destroy
  has_many :passport_requests,         :dependent => :destroy

  has_and_belongs_to_many :companies

  accepts_nested_attributes_for :profile

  scope :admins, -> { where({:is_admin => true}) }

  validates :password, :confirmation => true

  validates :first_name,
            :last_name,
            :email,
            :presence => true,
            :if => :first_or_last_step?

  # after_create { self.build_profile.save(:validate => false) }
  after_create :send_welcome_email

  def profile
    super || build_profile
  end

  def full_name
    [first_name, middle_name, last_name].join(' ')
  end
  alias :username :full_name

  def first_or_last_step?
    step1? || step3? || active?
  end

  def companies_list
    companies.pluck(:name).join(', ')
  end

  def manager?
    kind_of?(Manager)
  end

  def admin?
    is_admin
  end

  def agreed_terms?
    is_agreed_terms
  end

  def passport
    passports.where({:is_primary => true}).first
  end

  def has_passport?
    passport.present?
  end

  def passport_request
    passport_requests.where({:is_processed => false}).first
  end

  def has_passport_request?
    passport_request.present?
  end

  private

    def send_welcome_email
      UserMailer.delay.welcome(self, password)
    end

end
