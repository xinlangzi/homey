require 'rails_helper'

RSpec.describe Property, type: :model do
  subject{ create(:property) }
  it { should belong_to(:district) }
  it { should belong_to(:area) }
  it { should validate_presence_of(:available_date) }
  it { should validate_presence_of(:district) }
  it { should have_many(:images) }

  context "callback" do
    it "auto property id" do
      expect(subject.property_id).not_to be_nil
      expect(subject.property_id.length).to eq(6)
    end
  end

  context ".latest" do
    let(:latest) { {} }
    it "should return list by area" do
      subject.reload
      Property.latest.map do |key, value|
        latest[key.name] = value
      end
      expect(latest).to include({"Rui Jing" => [subject]})
    end
  end

  context ".bedroom_count" do

    it "should remove consider 6 to be >= 5" do
      subject.reload
      expect(Property.ransack("bedroom_count" => "3").result.length).to eq(1)
      expect(Property.ransack("bedroom_count" => "5").result).to be_empty
      expect(Property.ransack("bedroom_count" => "6").result).to be_empty
      subject.update_attribute(:bedrooms, 5)
      expect(Property.ransack("bedroom_count" => "5").result.length).to eq(1)
      expect(Property.ransack("bedroom_count" => "6").result.length).to eq(1)
      subject.update_attribute(:bedrooms, 6)
      expect(Property.ransack("bedroom_count" => "5").result).to be_empty
      expect(Property.ransack("bedroom_count" => "6").result.length).to eq(1)
      subject.update_attribute(:bedrooms, 7)
      expect(Property.ransack("bedroom_count" => "5").result).to be_empty
      expect(Property.ransack("bedroom_count" => "6").result.length).to eq(1)
    end
  end
end
