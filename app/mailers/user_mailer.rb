class UserMailer < ActionMailer::Base
  default from: "birdsounds@example.com"

  def signup_confirm(user)
    @user = user
    mail to: user.email, subject: "Welcome to BirdSounds"
  end

  def tag_notification(tagged_user, chirp)
    @tagged_user = tagged_user
    @chirp = chirp
    mail to: tagged_user.email, subject: "#{chirp.user.name} tagged you in a chirp!"
  end
end
