class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :handle, uniqueness: true, presence: true
  validates :name, presence: true

  has_many :chirps

  after_create :send_welcome_message

  def send_welcome_message
    UserMailer.signup_confirm(self).deliver
  end

  def following
    follows = Follow.where(:follower_id => self.id)
    following = follows.map { |f| User.find(f.followed_id) }
  end

  def followers
    follows = Follow.where(:followed_id => self.id)
    followers = follows.map { |f| User.find(f.follower_id) }
  end

end
