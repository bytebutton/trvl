class Company < Base::VersionModel

  has_and_belongs_to_many :managers, :join_table => 'companies_managers'
  has_and_belongs_to_many :users

  has_many :trips,     :through => :users
  has_many :visas,     :through => :users
  has_many :passports, :through => :users

  validates :name,
            :presence => true

end
