FactoryGirl.define do
  factory :companies_manager do
    manager_id { User.last }
    company_id { Company.last }
  end
end