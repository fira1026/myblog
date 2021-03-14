class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update, :edit]
  
  def index
    @users = User.all.order(id: :asc).paginate(page: params[:page], per_page: 5)
  end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(author_params)
  #   if @user.save
  #     # session[:user_id] = @user.id
  # 	  flash[:success] = "Welcome to the alpha blog #{@user.email}"
  #     redirect_to posts_path
  #   else
  # 	  render action: 'new', alert: "Create user failed."
  #   end 
  # end

  def update
    if @user.update(user_params)
      flash[:success] = "Account was successfully updated"
      redirect_to posts_path
    else
      render 'edit', alert: "Account was not updated"
    end
  end

  def show
    @user_posts = @user.posts.order(created_at: :desc
      ).paginate(page: params[:page], per_page: 3)
  end

  def edit
    if !is_signed_in?
      flash[:danger] = "必須登入後才能進行此操作"
      redirect_to users_path
    else
      if current_user.id != @user.id
        flash[:danger] = "很抱歉，你沒有操作權限"
        redirect_to users_path
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :remember_me)
  end

  def set_user
    @user = User.find(params[:id])
  end

end