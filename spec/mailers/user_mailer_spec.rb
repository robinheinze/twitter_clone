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

end
