class Image < ActiveRecord::Base
  belongs_to :user
  belongs_to :imageable, polymorphic: true
  mount_uploader :file, WatermarkUploader
  validates :file, presence: true
  
  before_save do
    self.default_image = true unless imageable.try(:default_image).present?
  end
end
