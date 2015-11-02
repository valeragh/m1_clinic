class HomeController < ApplicationController
  def index
  	@posts = Post.first(4)
  end

end