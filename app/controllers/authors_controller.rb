class AuthorsController < ApplicationController

  before_action :set_author, only: [:edit, :update, :show]
  
  def index
    @authors = Author.all.order(id: :asc).paginate(page: params[:page], per_page: 5)
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      session[:user_id] = @author.id
  	  flash[:success] = "Welcome to the alpha blog #{@author.name}"
      redirect_to posts_path
    else
  	  render action: 'new', alert: "Signup failed."
    end 
  end

  def update

    if @author.update(author_params)
      flash[:success] = "Account was successfully updated"
      redirect_to posts_path
    else
      render 'edit', alert: "Account was not updated"
    end
  end

  def show
    @author_posts = @author.posts.order(created_at: :desc
      ).paginate(page: params[:page], per_page: 3)
  end

  def edit
    if !logged_in?
      flash[:danger] = "必須登入後才能進行此操作"
      redirect_to login_path
    else
      if current_user.id != @author.id
        flash[:danger] = "很抱歉，你沒有操作權限"
        redirect_to authors_path
      end
    end
  end

  private
  def author_params
    params.require(:author).permit(:name, :email, :password)
  end

  def set_author
    @author = Author.find(params[:id])
  end

end