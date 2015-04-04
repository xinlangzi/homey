FactoryGirl.define do
  factory :property do
    category :apartments
    title "FuLong"
    property_id "XMFL001"
    price "5000"
    bedrooms 3
    bathrooms 2
    dens 1
    storage_rooms 1
    surface_area 150
    utility_charge_included false
    district_id 1
    short_term_lease false
    business_center "Richest"
    available_date Date.today
    district
  end

end
