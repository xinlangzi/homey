class Property < ActiveRecord::Base
  extend FriendlyId
  friendly_id :property_id, use: :slugged
  belongs_to :district
  has_many :photos, dependent: :destroy
  validates :district, presence: true, associated: true
  validates :property_id, uniqueness: true, presence: true
end
