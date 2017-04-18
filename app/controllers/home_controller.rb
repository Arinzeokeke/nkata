class HomeController < ApplicationController
  layout "head"
  def index
  	@posts = Post.all
  end
end
