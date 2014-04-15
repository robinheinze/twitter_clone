class Followed < User
  has_many :follows, :foreign_key => "followed_id"
  has_many :followers, through: :follows
end
