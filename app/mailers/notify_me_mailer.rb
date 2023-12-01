class NotifyMeMailer < ApplicationMailer

  def notify_message
    @email = params[:email]
    mail(to: Rails.application.credentials.gmail[:email], subject: "Please notify me of Atlas's Launch!", from: @email)
  end

end
