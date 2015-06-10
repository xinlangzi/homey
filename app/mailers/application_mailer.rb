class ApplicationMailer < ActionMailer::Base
  default from: "realestate@homeyagency.com"
  layout 'mailer'

  def new_inquiry(inquiry_id)
    @inquiry = Inquiry.find(inquiry_id)
    mail(to: System.first.email, subject: "Prospective Customer Left Inquiry")
  end

  def new_request(request_id)
    @request = Request.find(request_id)
    mail(to: System.first.email, subject: "Prospective Customer Left Request")
  end

  def charge_reminder(charge_id)
    @charge = Charge.find(charge_id)
    @order = @charge.order
    @user = @order.user
    mail(to: @user.email, subject: "You have a charge that needs to be paid")
  end

  def lease_reminder(order_id)
    @order = Order.find(order_id)
    @user = @order.user
    mail(to: @user.email, subject: "Do you want to renew the lease?")
  end
end
