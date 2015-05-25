require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:property) }
  it { should validate_presence_of(:property) }
end
