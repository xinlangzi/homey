class District < ActiveRecord::Base
  has_many :rental_units
end
