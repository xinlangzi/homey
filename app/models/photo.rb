class Photo < ActiveRecord::Base
  belongs_to :property
  mount_uploader :file, WatermarkUploader
  validates :file, presence: true
end
