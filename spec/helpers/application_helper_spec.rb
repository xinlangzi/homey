require 'spec_helper'

describe ApplicationHelper do
  describe "#date_label" do
    it "returns 'Available Date'" do
      property = create(:property, category: :apartments)
      expect(helper.date_label(property)).to eq("Available Date")
    end
    it "returns 'Being Occupied Until'" do
      property = create(:property, category: :serviced_apartments)
      expect(helper.date_label(property)).to eq("Being Occupied Until")
    end
  end
end
