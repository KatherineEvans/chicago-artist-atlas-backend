class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome_message.subject
  #
  def welcome_message
    @greeting = "Welcome to Chicago Artist Atlas!"

    mail(to: "katevansdev@gmail.com", subject: "Welcome to Chicago Artist Atlas!")
  end
end
