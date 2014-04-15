require "spec_helper"

describe UserMailer do
  describe "signup_confirm" do
    let(:user) { FactoryGirl.create(:user)}
    let(:mail) { UserMailer.signup_confirm(user) }

    it "renders the headers" do
      mail.subject.should eq("Welcome to BirdSounds")
      mail.to.should eq([user.email])
      mail.from.should eq(["birdsounds@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Chirp chirp Name,\r\n\r\nWelcome to BirdSounds.\r\n\r\nLove from,\r\nEveryone else\r\n")
    end
  end

  describe "tag_notification" do
    let(:test_user) { FactoryGirl.create(:user)}
    let(:user) { FactoryGirl.create(:user) }
    let(:test_chirp) { Chirp.create(:content => "This is the @#{test_user.handle} content", :title => "Title", :user_id => user.id) }
    let(:mail) { UserMailer.tag_notification(test_user, test_chirp) }

    it "renders the headers" do
      mail.subject.should eq("#{test_chirp.user.name} tagged you in a chirp!")
      mail.to.should eq([test_user.email])
      mail.from.should eq(["birdsounds@example.com"])
    end

    # it "renders the body" do
    #   mail.body.encoded.should match("")
    # end
  end

end
