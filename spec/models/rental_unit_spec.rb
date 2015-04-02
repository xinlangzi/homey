require 'rails_helper'

RSpec.describe RentalUnit, type: :model do
  it { should belong_to(:district) }
end
