FactoryGirl.define do
  factory :user do
    confirmed_at Time.now
    name "Test User"
    sequence :email do |n|
      "person#{n}@example.com"
    end

    password "please123"

    trait :admin do
      role 'admin'
    end

    trait :vip do
      role 'vip'
    end

  end
end
