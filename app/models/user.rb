class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :family,optional: true
  belongs_to :estate,optional: true
  has_many :cars, dependent: :destroy
  accepts_nested_attributes_for :cars
  attr_accessor :temp_password

  before_validation :assign_default_password, if: Proc.new { |user| user.password.blank? }
  after_save :send_welcome_mail


  def assign_default_password
    self.temp_password = Devise.friendly_token.first(8)
    self.password = self.temp_password
    self.password_confirmation = self.temp_password
  end


  def send_welcome_mail
    UserMailer.with(user: self, password: self.temp_password).welcome_email.deliver_later
  end

end
