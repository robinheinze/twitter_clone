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

  it 'knows who it is following' do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    Follow.create(:follower_id => user.id, :followed_id => user2.id)
    user.following.should eq [user2]
  end

  it 'knows who is following it' do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    Follow.create(:follower_id => user.id, :followed_id => user2.id)
    user2.followers.should eq [user]
  end
end
