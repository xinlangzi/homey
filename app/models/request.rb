class Request < ActiveRecord::Base
  enum kind: { expat: 1, landlord: 2}
  enum intention: { rent: 1, buy: 2, sell: 3 }
  validates :kind, presence: true
  validates :name, presence: true
  validates :email, presence: true
  validates :mobile_phone, presence: true
end
