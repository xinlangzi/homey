class Post < ActiveRecord::Base
  validates :title, presence: true
  scope :latest, -> { order("created_at desc").limit(10) }
  
  def to_s
    self.title
  end
end
