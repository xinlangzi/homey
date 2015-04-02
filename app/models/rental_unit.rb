class RentalUnit < ActiveRecord::Base
  belongs_to :district
  validates :district, presence: true, associated: true
  validates :property_id, uniqueness: true
end
