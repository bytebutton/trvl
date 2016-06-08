class VisaEntry < Base::SeedModel

  has_many :visas, :dependent => :nullify

end
