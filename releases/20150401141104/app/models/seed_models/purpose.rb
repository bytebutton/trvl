class Purpose < Base::SeedModel

  has_many :trips, :dependent => :nullify
  has_many :visas, :dependent => :nullify

end
