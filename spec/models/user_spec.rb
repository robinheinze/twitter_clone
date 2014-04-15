require 'spec_helper'

describe User do
  it 'sends a welcome email' do
    user = FactoryGirl.build(:user)
    expect(UserMailer).to receive(:signup_confirm).with(user).and_return(double("mailer", :deliver => true))
    user.save
  end
end
