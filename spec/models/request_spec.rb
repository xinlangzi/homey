require 'rails_helper'

RSpec.describe Request, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :mobile_phone }
end
