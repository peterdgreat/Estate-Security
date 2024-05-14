class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :family,optional: true
  belongs_to :estate,optional: true
  has_many :cars, dependent: :destroy
  has_many :visitors, dependent: :destroy
  accepts_nested_attributes_for :cars
  has_one_attached :avatar
  attr_accessor :temp_password

  before_save :generate_pass_in_code
  before_validation :assign_default_password, if: Proc.new { |user| user.password.blank? }
  after_save :send_welcome_mail


  private


  def assign_default_password
    self.temp_password = Devise.friendly_token.first(8)
    self.password = self.temp_password
    self.password_confirmation = self.temp_password
  end

  def generate_pass_in_code
    self.pass_in_code = SecureRandom.random_number(1e6).to_i
  end


  def send_welcome_mail
    UserMailer.with(user: self, password: self.temp_password).welcome_email.deliver_later
  end

end
