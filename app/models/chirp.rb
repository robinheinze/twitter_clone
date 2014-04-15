class Chirp < ActiveRecord::Base
  belongs_to :user
  validates :content, presence: true, length: { maximum: 102 }
  validates :title, presence: true

  def find_handles
    handles = self.content.scan(/@[A-z]*\b/)
    users = []
    if handles
      handles.map{ |handle| handle.slice(1..-1)}
      handles.each do |handle|
        users << User.find_by(:handle => handle)
      end
    end
    users
  end
end
