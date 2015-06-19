class ApplicationMailerPreview < ActionMailer::Preview

  def lease_reminder
    order = Order.first
    ApplicationMailer.lease_reminder(order.id)
  end

  def renewal_lease_reminder
    order = Order.first
    ApplicationMailer.renewal_lease_reminder(order.id)
  end

  def renewal_internet_reminder
    order = Order.first
    ApplicationMailer.renewal_internet_reminder(order.id)
  end
end