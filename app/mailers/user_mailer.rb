class UserMailer < ActionMailer::Base
  default from: "info@hutgeeks.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Activate your Account')
  end
end
