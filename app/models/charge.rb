class Charge < ActiveRecord::Base
  belongs_to :order

  enum category: { rent: 0, internet: 1, electric: 2, water: 3, gas: 4, property_management: 5, cable_tv: 6, satellite_tv: 7 }
end
