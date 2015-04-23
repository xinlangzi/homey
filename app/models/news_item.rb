class NewsItem < ActiveRecord::Base
  validates :title, presence: true
  
  scope :latest, -> { order("created_at desc").limit(10) }
end
