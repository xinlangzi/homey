require 'rails_helper'

RSpec.describe Request, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :mobile_phone }
  
  let(:request) { create(:request) }
  it "should create a mailer after create" do
    Sidekiq::Worker.jobs.clear
    request.reload
    jobs = Sidekiq::Worker.jobs
    expect(jobs.length).to eq(1)
    job = jobs[ActiveJob::QueueAdapters::SidekiqAdapter::JobWrapper].first
    expect(job["at"].to_f - job["enqueued_at"].to_f).to eq(60.0)
    args = job["args"].first["arguments"]
    expect(args[0..1] << args[3]).to eq(["ApplicationMailer", "new_request", request.id])
  end
end
