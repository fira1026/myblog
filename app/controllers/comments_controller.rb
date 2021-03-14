class CommentsController < ApplicationController

  def new 
    @comment = Comment.new(post_id: params[:post_id])
    #@comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
  	  # flash[:success] = "Post was created"
      redirect_to post_path(@comment.post)
    else
  	  render action: 'new', alert: "Created failed."
    end 
  end

  def index
    @comments = Comment.order(created_at: :desc
    	).paginate(page: params[:page], per_page: 10)
  end

  private
  def comment_params
    # Rails.logger.debug "=============================="
    # Rails.logger.debug comment_params.inspect
    params.require(:comment).permit(:body, :post_id)
  end

  def set_post
    @comment = Comment.find(params[:id])
  end

end

