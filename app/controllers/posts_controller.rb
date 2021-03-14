class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :destroy]

  def new
    if !logged_in?
      flash[:danger] = "必須登入後才能進行此操作"
      redirect_to login_path
    end
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
    if !logged_in?
      flash[:danger] = "必須登入後才能進行此操作"
      redirect_to login_path
    else
      if session[:user_id] != @post.author.id
        flash[:danger] = "很抱歉，你沒有操作權限"
        redirect_to post_path(@post)
      end
    end
  end

  def index
    @posts = Post.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  def destroy
    if !logged_in?
      flash[:danger] = "必須登入後才能進行此操作"
      redirect_to login_path
    else
      if session[:user_id] != @post.author.id
        flash[:danger] = "很抱歉，你沒有操作權限"
      end
    end

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