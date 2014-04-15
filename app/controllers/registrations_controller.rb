class RegistrationsController < Devise::RegistrationsController
  def create
    super
    UserMailer.signup_confirm(@user).deliver unless @user.invalid?
  end
end
