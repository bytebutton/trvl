FactoryGirl.define do
  factory :user, :class => User do
    email           { Faker::Internet.email }
    password        { '123123' }
    step            { 'active' }
    is_agreed_terms { true }

    after :build do |user|
      create(:user_profile, { :user => user })
    end

    after :create do |user|
      rand(1..3).times { create(:passport, { :user => user }) }
    end

  end
end