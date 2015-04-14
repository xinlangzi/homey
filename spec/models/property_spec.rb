require 'rails_helper'

RSpec.describe Property, type: :model do
  subject{ create(:property) }
  it { should belong_to(:district) }
  it { should belong_to(:area) }
  it { should validate_uniqueness_of(:property_id) }
  it { should validate_presence_of(:available_date) }
  it { should validate_presence_of(:property_id) }
  it { should validate_presence_of(:district) }
  it { should have_many(:images) }
  
  describe ".latest" do
    let(:latest) { {} }
    it "should return list by area" do
      subject.reload
      Property.latest.map do |key, value|
        latest[key.name] = value
      end
      expect(latest).to include({"Rui Jing" => [subject]})
    end
  end
  
  describe ".sanitize_params" do
    it "should remove empty booleans" do
      hash = { q: { boolean32: "0", keep_me: "0", bedrooms_eq: "6" } }
      Property.sanitize_params(hash)
      expect(hash[:q][:boolean32]).to be_nil
      expect(hash[:q][:keep_me]).to eq("0")
      expect(hash[:q][:bedrooms_eq]).to be_nil
      expect(hash[:q][:bedrooms_gteq]).to eq("5")
    end
  end
end
