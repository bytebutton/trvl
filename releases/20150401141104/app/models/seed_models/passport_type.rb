class PassportType < Base::SeedModel

  has_many :passports, :dependent => :nullify

end
