class Image < ActiveRecord::Base
  belongs_to :user
  belongs_to :imageable, polymorphic: true
  mount_uploader :file, WatermarkUploader
  validates :file, presence: true
end
