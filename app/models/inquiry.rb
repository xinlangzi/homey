class Inquiry < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :comment, presence: true
  
  after_create do
    InquiryMailer.prospective_customer(self.id).deliver_later
  end
end
