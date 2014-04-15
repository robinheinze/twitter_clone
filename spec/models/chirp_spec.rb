require 'spec_helper'

describe Chirp do
  it 'can identify a user handle in its content' do
    test_user = FactoryGirl.create(:user)
    user = FactoryGirl.create(:user)
    test_chirp = Chirp.new(:content => "This is the @#{test_user.handle} content", :title => "Title", :user_id => user.id)
    test_chirp.find_handles.should eq [test_user]
  end

  it { should belong_to :user }
  it { should validate_presence_of :title }
  it { should validate_presence_of :content }
end

