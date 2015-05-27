class Charge < ActiveRecord::Base
  belongs_to :order
  
  validates :order, presence: true
  validates :category, presence: true
  validates :amount, presence: true
  validates :due_date, presence: true
  
  scope :rentals, -> { where("category = ?", Charge.categories[:rent]) }
  scope :unreminded, -> { where(reminded: false) }
  scope :unpaid, -> { where(paid: false) }

  enum category: { rent: 0, internet: 1, electric: 2, water: 3, gas: 4, property_management: 5, cable_tv: 6, satellite_tv: 7 }
  
  def send_reminder
    # use mailer
    self.update_attributes!(:reminder_sent_date, Today.now)
  end
  
  def self.automate
    create_rental_charges
    send_rental_reminders
  end
  
  def self.create_rental_charges
    Order.all.each do |order|
      order.charges.create!(category: :rent, amount: order.rent, due_date: order.lease_start) if order.charges.rentals.size == 0
      latest_due_date = order.charges.rentals.order("due_date desc").limit(1).first.due_date
      next_due_date = latest_due_date + order.period_length.send(:months)
      order.charges.create!(category: :rent, amount: order.rent, due_date: next_due_date) if Time.now >= next_due_date - order.pre_alert_day.send(:days)
    end
  end
  
  def self.send_rental_reminders
    Charge.unreminded.unpaid.rentals.each do |charge|
      charge.send_reminder
    end
  end
end
