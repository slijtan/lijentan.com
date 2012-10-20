class PostsController < ApplicationController
  def index
    items_per_page = params[:items_per_page] || 10
    @posts = Post.where(published: true).order('date_published DESC').limit(items_per_page)
  end
end
