require 'rails_helper'

RSpec.describe NewsItem, type: :model do
  it { should validate_presence_of(:title) }

  describe ".latest" do
    it "should return only 10 items" do
      create_list(:news_item, 11)
      expect(NewsItem.latest.length).to eq(10)
    end
  end
end
