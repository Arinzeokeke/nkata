class ProfilesController < ApplicationController
	before_action :get_user
  	def show
  	end

  	private

  	def get_user
  		@user = User.find(params[:id])
  		@posts = @user.posts.order('created_at DESC')
  		@comments = @user.comments.order('created_at DESC')
    end
end
