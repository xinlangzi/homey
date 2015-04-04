class Property < ActiveRecord::Base
  extend FriendlyId
  include PropertyConstant

  friendly_id :property_id, use: :slugged

  belongs_to :district
  has_many :images, as: :imageable

  validates :category, :available_date, presence: true
  validates :district, presence: true, associated: true
  validates :property_id, uniqueness: { case_sensitive: false }, presence: true

  enum category: { apartments: 1, villas: 2, lane_houses: 3, studios: 4, shops: 5, offices: 6, serviced_apartment: 7, others: 8 }

end
