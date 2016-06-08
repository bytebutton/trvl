class Manager < User
  has_and_belongs_to_many :companies, :join_table => 'companies_managers'
  has_many :users,                    :through    => :companies
end
