require 'rails_helper'

RSpec.describe Banner, type: :model do
  it { should validate_presence_of(:file) }
end
