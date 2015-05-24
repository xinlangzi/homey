FactoryGirl.define do
  factory :order do
    name "MyString"
property_id "MyString"
lease_start "2015-05-24"
lease_end "2015-05-24"
bank_account "MyText"
rent "9.99"
period_length 1
pre_alert_day 1
user nil
  end

end
