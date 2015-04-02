FactoryGirl.define do
  factory :rental_unit do
    title "MyString"
property_id "MyString"
price "9.99"
number_of_bedrooms 1
number_of_bathrooms 1
number_of_dens 1
number_of_storage_rooms 1
surface_area 1.5
utility_charge_included false
district_id ""
short_term_lease false
business_center "MyText"
available_date "2015-04-01"
  end

end
