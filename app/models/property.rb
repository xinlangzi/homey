class Property < ActiveRecord::Base
  extend FriendlyId
  include PropertyConstant

  friendly_id :property_id
  mount_uploader :map, SimpleUploader

  belongs_to :district
  belongs_to :area
  has_many :images, -> { order("default_image desc") }, as: :imageable

  validates :category, :title, :available_date, presence: true
  validates :district, presence: true, associated: true
  validates :area, presence: true, associated: true
  validates :property_id, uniqueness: { case_sensitive: false }

  enum category: { apartments: 1, villas: 2, lane_houses: 3, studios: 4, shops: 5, offices: 6, serviced_apartments: 7, others: 8 }

  scope :bedroom_count, ->(amount) { amount == "6" ? where('bedrooms >= 5') : where('bedrooms = ?', amount)}

  before_create :auto_property_id

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
  
  def default_image
    images.where(default_image: true).first
  end

  def default_image_id
    default_image.id
  end

  def default_image_id=(image_id)
    old_image = default_image
    old_image.update_attributes!(default_image: false)
    images.where(id: image_id).first.update_attributes!(default_image: true)
  end
  
  private

  def self.ransackable_scopes(auth_object = nil)
    [:bedroom_count]
  end

  def auto_property_id
    secure_random = SecureRandom.hex(3).upcase
    while Property.find_by(property_id: secure_random)
      secure_random = SecureRandom.hex(3).upcase
    end
    self.property_id = secure_random
  end
end
