class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.estate_mail
  layout "mailer"
end
