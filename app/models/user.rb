class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :handle, uniqueness: true
  has_many :chirps

  after_create :send_welcome_message

  def send_welcome_message
    UserMailer.signup_confirm(self).deliver
  end

end
