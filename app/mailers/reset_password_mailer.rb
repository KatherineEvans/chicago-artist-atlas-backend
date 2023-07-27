class ResetPasswordMailer < Devise::Mailer
  default from: email_address_with_name("#{Rails.application.credentials.gmail[:email]}", 'Chicago Artist Atlas')
  layout "mailer"
 
  def reset_password_instructions(record, token, opts={})
    super
  end
  
end