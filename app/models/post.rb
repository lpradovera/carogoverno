class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :posted_at, :user_id
  has_many :votes
  validates_presence_of :body, :posted_at, :user_id

  scope :order_by_score, lambda {|direction| 
    joins("LEFT JOIN votes ON votes.post_id = posts.id").group("posts.id").select("posts.*, sum(votes.vote) AS score").order("score #{direction}")
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

  def add_vote(vote, user_id)
    if user_can_vote(user_id)
      vote = Vote.new({
        post_id: id,
        user_id: user_id,
        vote: vote > 0 ? 1 : -1
      }).save
      return true
    end
    return false
  end
end
