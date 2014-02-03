class UserMailer < ActionMailer::Base
  default from: "info@hutgeeks.com"

  def welcome_email(user)
    @user = user
    @url  = 'localhost:3000/accounts/activate'
    mail(to: @user.email, subject: 'Welcome to EnterpriseCollab - Activate & Get Empowered')
  end
end
