class Banner < ActiveRecord::Base
  mount_uploader :file, WatermarkUploader
  validates :file, presence: true
end
