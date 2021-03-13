class AuthorsController < ApplicationController
  
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
  	  flash[:notice] = "Account was successfully created"
      redirect_to author_path(@author)
    else
  	  render action: 'new', alert: "Signup failed."
    end 
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      flash[:notice] = "Account was successfully updated"
      redirect_to author_path(@author)
    else
      render 'edit', alert: "Account was not updated"
    end
  end

  def show
    @author = Author.find(params[:id])
  end

  def edit
    @author = Author.find(params[:id])
  end

  private
  def author_params
    params.require(:author).permit(:name, :email)
  end

end