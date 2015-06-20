# Preview all emails at http://localhost:3000/rails/mailers/application_mailer

class ApplicationMailerPreview < ActionMailer::Preview

  def lease_reminder
    order = Order.first
    ApplicationMailer.lease_reminder(order.id)
  end

  def new_inquiry
    inquiry = Inquiry.first
    ApplicationMailer.new_inquiry(inquiry.id)
  end

  def new_request
    request = Request.first
    ApplicationMailer.new_request(request.id)
  end

  def charge_reminder
    charge = Charge.first
    ApplicationMailer.charge_reminder(charge.id)
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