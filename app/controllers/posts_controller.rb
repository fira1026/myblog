class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
  	  # flash[:success] = "Post was created"
      redirect_to post_path(@post)
    else
  	  render action: 'new', alert: "Signup failed."
    end 
  end

  def show
  end

  def update
    if @post.update(post_params)
      # flash[:success] = "Post was updated"
      redirect_to post_path(@post)
    else
      render 'edit', alert: "Post was not updated"
    end
  end

  def edit
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def destroy
    @post.destroy
    # flash[:success] = "Post was deleted"
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end