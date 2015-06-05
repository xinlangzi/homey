require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:property) }
  it { should validate_presence_of(:property) }
  it { should validate_presence_of(:lease_start)}
  it { should validate_presence_of(:period_length)}
  it { should validate_presence_of(:pre_alert_day)}
  it { should validate_presence_of(:rent)}
end
