class Photo < ActiveRecord::Base
  belongs_to :rental_unit
  mount_uploader :file, WatermarkUploader
  validates :file, presence: true
end
