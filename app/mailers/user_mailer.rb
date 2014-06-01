class UserMailer < ActionMailer::Base
  default from: "trosborn@gmail.com"

  def welcome_email user
    @user = user
    @url = 'http://trosborn.com/login'
    mail(to: @user.email, subject: 'Thanks for visiting my site')
  end
end
