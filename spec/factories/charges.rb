FactoryGirl.define do
  factory :charge do
    association(:order)
    due_date "2015-05-25"
    category 0
    amount "9.99"
    note "MyText"
    paid false
  end
end
