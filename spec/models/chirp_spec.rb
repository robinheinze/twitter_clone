require 'spec_helper'

describe Chirp do
  it 'can identify a user handle in its content' do
    test_user = FactoryGirl.create(:user)
    user = FactoryGirl.create(:user)
    test_chirp = Chirp.new(:content => "This is the @#{test_user.handle} content", :title => "Title", :user_id => user.id)
    test_chirp.find_handles.should eq [test_user]
  end

  # it 'sends a tag notification' do
  #   test_user = FactoryGirl.create(:user)
  #   user = FactoryGirl.create(:user)
  #   test_chirp = Chirp.new(:content => "This is the @#{test_user.handle} content", :title => "Title", :user_id => user.id)
  #   expect(UserMailer).to receive(:tag_notification).with(test_user, test_chirp)
  #   test_chirp.save
  # end
end

