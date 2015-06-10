FactoryGirl.define do
  factory :order do
    name "John Smith"
    association :user
    association :property
    lease_start { 1.year.ago.to_date }
    lease_end { 1.month.since.to_date }
    bank_account "MyText"
    rent "9.99"
    period_length 2
    pre_alert_day 7
  end
end
