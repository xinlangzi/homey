class User < ActiveRecord::Base

  has_many :orders, dependent: :destroy

  enum role: [:user, :vip, :admin, :customer_service]

  after_initialize :set_default_role, :if => :new_record?

  scope :name_asc, ->{ order("name ASC") }

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  def name_email
    [name, email].compact.join(': ')
  end
end
