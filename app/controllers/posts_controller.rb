class PostsController < ApplicationController

  def index
    items_per_page = params[:items_per_page] || 10
    offset = params[:offset] || 0
    @space_of_last_post = params[:space_of_last_post]

    @posts = Post.where(published: true).order('date_published DESC').offset(offset).limit(items_per_page)

    respond_to do |format|
      format.html # index.html.erb
      format.js # index.js.coffee
    end
  end

  def show
    @post = Post.find(params[:id])
  end
end
