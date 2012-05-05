class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :posted_at, :user_id
  has_many :votes
  validates_presence_of :body, :posted_at, :user_id
end
