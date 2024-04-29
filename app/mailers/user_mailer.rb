class UserMailer < ApplicationMailer
  default from: 'peterdgreat2016@gmail.com'

  def welcome_email
    @user = params[:user]
    @password = params[:password]
    mail(to: @user.email, subject: 'Welcome to Peter Estate Community')
  end

end
