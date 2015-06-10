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
  validates :bank_account, presence: true

  attr_accessor :property_id_string

  before_validation do |order|
    if order.property_id_string.present?
      order.property = Property.friendly.find(order.property_id_string) rescue nil
    end
  end

  def self.automate
    lease_reminder
  end

  def lease_renewable?
    Date.today < lease_end.ago(1.month).to_date + 7.days
  end

  private

  def self.lease_reminder
    Order.where(lease_end: 1.month.since.to_date).find_each do |order|
      ApplicationMailer.lease_reminder(order.id).deliver_later!(wait: 1.minute)
    end
  end
end
