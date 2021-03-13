class AuthorsController < ApplicationController

  before_action :set_author, only: [:edit, :update, :show]
  
  def index
    @authors = Author.all.order(id: :asc)
  end

  def new
    @author = Author.new
  end

  def create
    # render plain: params[:author].inspect
    @author = Author.new(author_params)
    if @author.save
  	  flash[:success] = "Welcome to the alpha blog #{@author.name}"
      redirect_to posts_path
    else
  	  render action: 'new', alert: "Signup failed."
    end 
  end

  def update
    if @author.update(author_params)
      flash[:success] = "Account was successfully updated"
      redirect_to author_path(@author)
    else
      render 'edit', alert: "Account was not updated"
    end
  end

  def show
  end

  def edit
  end

  private
  def author_params
    params.require(:author).permit(:name, :email, :password)
  end

  def set_author
    @author = Author.find(params[:id])
  end

end