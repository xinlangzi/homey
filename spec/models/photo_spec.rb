require 'rails_helper'

RSpec.describe Photo, type: :model do
  it { should belong_to :property }
  it { should validate_presence_of(:file) }
end
