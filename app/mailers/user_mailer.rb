class UserMailer < ApplicationMailer
  default from: Rails.application.credentials[:estate_mail]

  def welcome_email
    @user = params[:user]
    @password = params[:password]
    mail(to: @user.email, subject: 'Welcome to Peter Estate Community')
  end

end
