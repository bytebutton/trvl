class State < Base::SeedModel

  belongs_to :country
  has_many   :trips,   :dependent => :nullify

end
