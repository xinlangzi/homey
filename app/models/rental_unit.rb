class RentalUnit < ActiveRecord::Base
  belongs_to :district
  has_many :photos
  validates :district, presence: true, associated: true
  validates :property_id, uniqueness: true
end
