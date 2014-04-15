FactoryGirl.define do
  factory :user do
    name "Name"
    email { Faker::Internet.email }
    handle { Faker::Internet.user_name.gsub(/\W/, "") }
    password "123"
    password_confirmation { |u| u.password }
  end

  factory :chirp do
    title "This is the title"
    content "This is some content"
  end

  factory :chirp_with_handle, :class => Chirp do
    @referenced_user = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
    user_id @user2.id
    title 'This is the title'
    content "This the content with @#{@referenced_user.handle}"
  end
end
