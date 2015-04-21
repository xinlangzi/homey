class NewsItem < ActiveRecord::Base
  validates :title, presence: true
end
