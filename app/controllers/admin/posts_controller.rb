class Admin::PostsController < ApplicationController
  before_filter :check_valid_admin
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by_id!(params[:id])
  end

  def delete
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to "/admin/posts"
  end
end
