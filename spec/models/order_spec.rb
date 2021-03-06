require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:vip){ create(:user, :vip) }
  let!(:order){ create(:order, user: vip) }
  it { should belong_to(:user) }
  it { should belong_to(:property) }
  it { should validate_presence_of(:property) }
  it { should validate_presence_of(:lease_start)}
  it { should validate_presence_of(:period_length)}
  it { should validate_presence_of(:pre_alert_day)}
  it { should validate_presence_of(:rent)}
  
  before do
    ActionMailer::Base.deliveries.clear
  end

  context '.automate' do
    it 'renew leases' do
      Order.automate
      expect(ActionMailer::Base.deliveries.first.subject).to eq("Do you want to renew the lease?")
    end
  end

  it '#lease_renewable?' do
    expect(Date.today.to_s).to eq("2015-05-01")
    expect(order.lease_end.to_s).to eq("2015-06-01")
    expect(order.lease_renewable?).to be_truthy
    Timecop.freeze(Time.local(2015, 5, 7, 6, 0)) do
      expect(order.lease_renewable?).to be_truthy
    end
    Timecop.freeze(Time.local(2015, 5, 8, 6, 0)) do
      expect(order.lease_renewable?).to be_falsey
    end
    Timecop.freeze(Time.local(2015, 6, 2, 6, 0)) do
      expect(order.lease_renewable?).to be_falsey
    end
  end

  it "#renewal_lease_reminder" do
    order.update(renewal_lease_month: 3)
    expect(ActionMailer::Base.deliveries.first.subject).to eq("Notification: Renewal lease")
    expect(order.reload.renew_lease_at).to eq(Time.now)
  end

  it "#renewal_internet_reminder" do
    order.update(renewal_internet_month: 3)
    expect(ActionMailer::Base.deliveries.first.subject).to eq("Notification: Renewal internet")
    expect(order.reload.renew_internet_at).to eq(Time.now)
  end
end
