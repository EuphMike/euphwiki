class UserMailer < ActionMailer::Base
  default from: "waddellmusic@gmail.com"

  def new_user(user)
    @user = user
    mail(to: user.email, subject: "Welcome to EuphWIKI!")
  end
end