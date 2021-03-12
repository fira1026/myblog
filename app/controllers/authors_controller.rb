class AuthorsController < ApplicationController
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

 def show
  @author = Author.find(params[:id])

 end

 private
  def author_params
   params.require(:author).permit(:name, :email)
  end

end