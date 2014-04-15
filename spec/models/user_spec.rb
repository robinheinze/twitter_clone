require 'spec_helper'

describe User do
  it 'sends a welcome email' do
    user = FactoryGirl.build(:user)
    expect(UserMailer).to receive(:signup_confirm).with(user).and_return(double("mailer", :deliver => true))
    user.save
  end

  it { should validate_presence_of :handle }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :handle }
  it { should have_many :chirps }
  it { should have_many :followers }
end
