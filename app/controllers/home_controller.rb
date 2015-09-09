class HomeController < ApplicationController
  def index
  	@posts = Post.first(3)
  end

end