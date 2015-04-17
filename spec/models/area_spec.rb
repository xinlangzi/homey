require 'rails_helper'

RSpec.describe Area, type: :model do
  it { should have_many :properties }
end
