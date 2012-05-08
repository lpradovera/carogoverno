class HomeController < ApplicationController
  def index
    @top_posts = Post.all
  end
end
