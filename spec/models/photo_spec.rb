require 'rails_helper'

RSpec.describe Photo, type: :model do
  it { should belong_to :rental_unit }
  it { should validate_presence_of(:file) }
end
