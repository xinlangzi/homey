require 'rails_helper'

RSpec.describe RentalUnit, type: :model do
  it { should belong_to(:district) }
  it { should validate_uniqueness_of(:property_id) }
end
