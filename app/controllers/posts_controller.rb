class PostsController < ApplicationController
  before_filter :check_valid_user, :except => [:index, :show]

  def index
    @posts = Post.order_by_score('DESC').all
    
    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end

  def show
    @post = Post.find_by_id!(params[:id])

    respond_to do |format|
      format.html { render :layout => request.xhr? ? false : true  }
      format.json { render json: @post }
    end
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html
      format.json { render json: @post }
    end
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id
    @post.posted_at = Time.now

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def voteup
    @post = Post.find_by_id!(params[:id])
    @post.add_vote(1,current_user.id)
    @response = {plus: @post.plus, minus: @post.minus}
    respond_to do |format|
      format.html
      format.json { render json: @response }
    end
  end

  def votedown
    @post = Post.find_by_id!(params[:id])
    @post.add_vote(-1,current_user.id)
    @response = {plus: @post.plus, minus: @post.minus}
    respond_to do |format|
      format.html
      format.json { render json: @response }
    end
  end
end
