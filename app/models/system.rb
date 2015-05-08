class System < ActiveRecord::Base
  mount_uploader :logo, SimpleUploader

  def self.default
    System.first || init
  end

  def self.init
    system = System.new
    system.save(validate: false)
    system
  end

end
