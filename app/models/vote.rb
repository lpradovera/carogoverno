class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates_presence_of :vote, :post_id, :user_id
  attr_accessible :vote, :post_id, :user_id, :voted_at

  scope :positive, where("vote = 1")
  scope :negative, where("vote = -1")
end
