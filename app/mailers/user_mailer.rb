class UserMailer < ActionMailer::Base
  default from: "birdsounds@example.com"

  def signup_confirm(user)
    @user = user

    mail to: user.email, subject: "Welcome to BirdSounds"
  end
end
