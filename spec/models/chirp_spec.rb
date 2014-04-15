require 'spec_helper'

describe Chirp do
  it 'can identify a user handle in its content' do
    test_chirp = FactoryGirl.create(:chirp_with_handle)
    test_chirp.find_handles.should eq [@referenced_user, @user2]
  end
end

