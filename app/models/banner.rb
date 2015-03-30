class Banner < ActiveRecord::Base
  mount_uploader :file, WatermarkUploader
end
