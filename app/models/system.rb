class System < ActiveRecord::Base
  mount_uploader :logo, SimpleUploader
end
