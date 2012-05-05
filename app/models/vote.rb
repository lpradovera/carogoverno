class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :vote
  validates_presence_of :like, :post_id, :user_id
  attr_accessible :like, :post_id, :user_id, :voted_at
end
