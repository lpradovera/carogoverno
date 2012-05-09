class HomeController < ApplicationController
  def index
    @top_posts = Post.order_by_score('DESC').take(3)
    @last_posts = Post.order('created_at DESC').limit(8)
  end
end
