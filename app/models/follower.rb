class Follower < User
  has_many :follows, :foreign_key => "follower_id"
  has_many :followeds, through: :follows
end
