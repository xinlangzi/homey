FactoryGirl.define do
  factory :order do
    name "MyString"
    association :user
    association :property
    lease_start "2015-05-24"
    lease_end "2015-12-24"
    bank_account "MyText"
    rent "9.99"
    period_length 2
    pre_alert_day 7
  end
end
