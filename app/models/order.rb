class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :property
  has_many :charges, dependent: :destroy
  accepts_nested_attributes_for :charges, allow_destroy: true
  validates :property, presence: true
  validates :lease_start, presence: true
  validates :lease_end, presence: true
  validates :period_length, presence: true
  validates :pre_alert_day, presence: true
  validates :rent, presence: true
  
  attr_accessor :property_id_string

  before_validation do |order|
    order.property = Property.friendly.find(order.property_id_string) rescue nil
  end
end
