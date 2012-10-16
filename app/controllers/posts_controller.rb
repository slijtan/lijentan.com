class PostsController < ApplicationController
  def index
    @posts = Post.where(published: true).order('date_published DESC') #.limit(10)
  end
end
