require 'rails_helper'

RSpec.describe Property, type: :model do
  it { should belong_to(:district) }
  it { should validate_uniqueness_of(:property_id) }
  it { should validate_presence_of(:property_id) }
  it { should have_many(:photos) }
end
