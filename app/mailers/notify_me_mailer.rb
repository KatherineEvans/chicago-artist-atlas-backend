class NotifyMeMailer < ApplicationMailer
  def notify_message
    @name = params[:name]
    @email = params[:email]
    @phone = params[:phone]
    @subject = params[:subject]
    @message = params[:message]

    mail(to: Rails.application.credentials.gmail[:email], subject: @subject, from: @email)
  end
end
