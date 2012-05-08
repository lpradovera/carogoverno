class HomeController < ApplicationController
  def index
    @top_posts = Post.order_by_score('DESC').all
  end
end
