class RegistrationsController < Devise::RegistrationsController
  def create
    super
    unless @user.invalid?
      UserMailer.signup_confirm(@user).deliver
    end
  end
end
