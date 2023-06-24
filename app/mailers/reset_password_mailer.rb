class ResetPasswordMailer < Devise::Mailer
  default from: "#{Rails.application.credentials.gmail[:email]}"
  layout "mailer"
 
  def reset_password_instructions(record, token, opts={})
    super
  end
  
end