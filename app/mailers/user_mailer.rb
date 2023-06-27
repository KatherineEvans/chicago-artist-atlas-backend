class UserMailer < ApplicationMailer

  def welcome_message
    @greeting = "Welcome to Chicago Artist Atlas!"
    @user = params[:user]
    mail(to: @user.email, subject: "Welcome to Chicago Artist Atlas!")
  end

  def complete_profile_message
    @greeting = "Complete Your Artist Profile"
    @user = params[:user]
    mail(to: @user.email, subject: "Complete Your Artist Profile!")
  end
end
