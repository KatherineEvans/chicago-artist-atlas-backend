class ApplicationMailer < ActionMailer::Base
  default from: email_address_with_name("#{Rails.application.credentials.gmail[:email]}", 'Chicago Artist Atlas')
  layout "mailer"
end
