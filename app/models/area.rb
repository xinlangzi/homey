class Area < ActiveRecord::Base
  has_many :properties
  validates :name, presence: true
  
  def to_s
    name + (description.present? ? " (#{description})" : "")
  end
end
