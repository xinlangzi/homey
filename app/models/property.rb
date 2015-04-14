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
  
  mount_uploader :map, SimpleUploader
  
  BEDROOM_SELECT = {
    "1 Br" => 1,
    "2 Brs" => 2,
    "3 Brs" => 3,
    "4 Brs" => 4,
    "5 Brs" => 5,
    "5 Brs+" => 6
  }
  
  # need this so that friendly_id will regenerate the slug in case the property_id changes
  def should_generate_new_friendly_id?
    true
  end

  def rooms
    [bedrooms, bathrooms, dens, storage_rooms].map(&:to_i).sum
  end
  
  def self.latest
    Area.all.reduce({}) do |hash, area|
      hash[area] = area.properties.order(updated_at: :desc).limit(6)
      hash
    end
  end
  
  def self.sanitize_params(parm)
    parm[:q].delete_if { |key, value| (key =~ /^boolean/ || key == "short_term_lease_eq") && value == "0" }
    
    if parm[:q][:bedrooms_eq] == "6"
      parm[:q].delete(:bedrooms_eq)
      parm[:q][:bedrooms_gteq] = "5"
    end
  end
  
end
