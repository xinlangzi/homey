require 'rails_helper'

RSpec.describe Charge, type: :model do
  describe ".send_rental_reminders" do
    let!(:charge) { create(:charge) }
    let(:jobs) { Sidekiq::Worker.jobs }
    let(:job) { jobs[ActiveJob::QueueAdapters::SidekiqAdapter::JobWrapper].first }
    let(:args) { job["args"].first["arguments"] }

    before do
      Sidekiq::Worker.jobs.clear
      Charge.send_rental_reminders
    end

    it "should send a reminder" do
      expect(jobs.length).to eq(1)
      expect(args[0..3]).to eq(["ApplicationMailer", "charge_reminder", "deliver_now", charge.id])
      expect(charge.reload.reminded).to be_truthy
    end
  end

  describe ".create_rental_charges" do
    let(:property) { create(:property) }
    let!(:order) { create(:order, property_id_string: property.property_id) }

    context "not yet time" do
      before do
        Timecop.freeze(order.lease_start + 4.months - 8.days)
        Charge.create_rental_charges
      end

      it "should create initial charges" do
        charges = Charge.all
        expect(charges.first.attributes).to include(
          "category" => Charge.categories["rent"],
          "amount" => order.rent,
          "due_date" => order.lease_start,
          "paid" => false,
          "reminded" => false
        )
        expect(charges.last.attributes).to include(
          "category" => Charge.categories["rent"],
          "amount" => order.rent,
          "due_date" => order.lease_start + 2.month,
          "paid" => false,
          "reminded" => false
        )
      end
    end

    context "time to create next charge" do
      before do
        Timecop.freeze(order.lease_start + 4.months - 7.days)
        Charge.create_rental_charges
      end

      it "should create two charges" do
        charges = Charge.all
        expect(charges.length).to eq(3)
        expect(charges.first.attributes).to include(
          "category" => Charge.categories["rent"],
          "amount" => order.rent,
          "due_date" => order.lease_start,
          "paid" => false,
          "reminded" => false
        )
        expect(charges.last.attributes).to include(
          "category" => Charge.categories["rent"],
          "amount" => order.rent,
          "due_date" => order.lease_start + 4.month,
          "paid" => false,
          "reminded" => false
        )
      end
    end

    after do
      Timecop.return
    end
  end
end
