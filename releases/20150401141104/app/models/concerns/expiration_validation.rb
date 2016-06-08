module ExpirationValidation
  extend ActiveSupport::Concern

  included do

    validate do
      errors.add(:valid_from, "Issue Date can't be more then Expiration Date") if self.valid_from > self.expires_on
    end

    validate do
      errors.add(:expires_on, "Expiration Date can't be less then Issue Date") if self.expires_on < self.valid_from
    end

  end

end
