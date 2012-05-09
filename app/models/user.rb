class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :confirmed_at
  has_many :posts
  has_many :votes
  # attr_accessible :title, :body
  
  def gravatar
    Digest::MD5.hexdigest(email)
  end

  def gravatar_path
    "http://www.gravatar.com/avatar/#{gravatar}.png"
  end
end
