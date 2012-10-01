class HomeController < ApplicationController
  def index
    @posts = Post.where(published: true).order(:date_published)
  end
end
