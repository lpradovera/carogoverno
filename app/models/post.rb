class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :posted_at, :user_id
  has_many :votes
  validates_presence_of :body, :posted_at, :user_id

  scope :order_by_score, lambda {|direction| 
    joins("LEFT JOIN votes ON votes.post_id = posts.id").group("votes.post_id").select("posts.*, sum(votes.vote) AS score").order("score #{direction}")
  }

  def plus
    votes.positive.size || 0
  end

  def minus
    votes.negative.size || 0
  end

  def has_vote_from_user(user_id)
    vote_obj = votes.where(["user_id = ?", user_id]).first
    vote_obj.vote if vote_obj
  end

  def user_can_vote_for(for_user_id)
    user_id != for_user_id && has_vote_from_user(for_user_id).nil?
  end
end
