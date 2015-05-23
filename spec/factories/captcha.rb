FactoryGirl.define do
  factory :captcha do
    question "What is the 3rd digit in 915428?"
    answer ["e4da3b7fbbce2345d7772b0674a318d5", "30056e1cab7a61d256fc8edd970d14f5"].to_s
  end
end
