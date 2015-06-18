class ApplicationMailerPreview < ActionMailer::Preview

  def lease_reminder
    order = Order.first
    ApplicationMailer.lease_reminder(order.id)
  end
end