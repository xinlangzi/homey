require 'rails_helper'

RSpec.describe District, type: :model do
  it { should have_many(:rental_units) }
end
