class CommentsController < ApplicationController
	#before_action :get_post
  before_action :authenticate_user!
	before_action :get_comment, only: [:destroy, :upvote, :downvote]
	before_action :find_commentable
    #before_action :authenticate_admin!, only: [:destroy]
	def create
    @comment = @commentable.comments.new comment_params
    @comment.user = current_user

    if @comment.save
      @comment.upvote_from(current_user)
      respond_to do |format|
        format.html do
          	flash[:success] = 'Comment posted.'
          	redirect_to :back
        end
        format.js # JavaScript response
      end      
    else
      redirect_to :back, notice: "Your comment wasn't posted!"
    end
  end

  def upvote
    @comment.upvote_from(current_user)
    respond_to do |format|
      format.html do
        flash[:success] = 'Comment liked.'
          redirect_to :back
        end
      format.js # JavaScript response
    end 
  end

  def downvote
    @comment.downvote_from(current_user)
    respond_to do |format|
      format.html do
        flash[:success] = 'Comment disliked.'
          redirect_to :back
        end
      format.js # JavaScript response
    end 
  end

	def destroy
		@comment.destroy
		respond_to do |format|
      		format.html do
        		flash[:success] = 'Comment deleted.'
        		redirect_to :back
      		end
      		format.js # JavaScript response
    	end
	end

	private
	def get_post
		@post = Post.find(params[:post_id])
	end

	def get_comment
		@comment = Comment.find(params[:id])
	end

	def comment_params
		params.require(:comment).permit( :text)
	end
	def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Post.find(params[:post_id]) if params[:post_id]
    end
end
