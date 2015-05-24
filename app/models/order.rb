class Order < ActiveRecord::Base
  belongs_to :user
  has_many :charges, dependent: :destroy
  accepts_nested_attributes_for :charges, allow_destroy: true
end
