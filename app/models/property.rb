class Property < ActiveRecord::Base
  extend FriendlyId
  include PropertyConstant

  friendly_id :property_id, use: :slugged

  belongs_to :district
  belongs_to :area
  has_many :images, as: :imageable

  validates :category, :title, :available_date, presence: true
  validates :district, presence: true, associated: true
  validates :area, presence: true, associated: true
  validates :property_id, uniqueness: { case_sensitive: false }, presence: true

  enum category: { apartments: 1, villas: 2, lane_houses: 3, studios: 4, shops: 5, offices: 6, serviced_apartments: 7, others: 8 }

  def rooms
    [bedrooms, bathrooms, dens, storage_rooms].map(&:to_i).sum
  end
  
  def self.latest
    Area.all.reduce({}) do |hash, area|
      hash[area] = area.properties.order(updated_at: :desc).limit(6)
      hash
    end
  end
end
