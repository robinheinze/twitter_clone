class Chirp < ActiveRecord::Base
  belongs_to :user
  validates :content, presence: true, length: { maximum: 102 }
  validates :title, presence: true

  # after_create :send_emails_to_tagged_users

  def find_handles
    handles = self.content.scan(/@[A-z]*\b/)
    users = []
    if handles
      handles.map{ |handle| handle.slice!(0)}
      handles.each do |handle|
        users << User.find_by(:handle => handle)
        # send_emails_to_tagged_users(user)
      end
    end
    users
  end

  def send_emails_to_tagged_users(tagged_user)
    UserMailer.tag_notification(tagged_user, self).deliver
  end
end
