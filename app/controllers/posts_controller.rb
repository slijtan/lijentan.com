class PostsController < ApplicationController

  before_filter :set_site

  # GET /sites/:site_id/posts
  def index
    items_per_page = params[:items_per_page] || 10
    offset = params[:offset] || 0
    @space_of_last_post = params[:space_of_last_post]

    @posts = @site.posts.where(published: true).order('date_published DESC').offset(offset).limit(items_per_page)

    respond_to do |format|
      format.html # index.html.erb
      format.js # index.js.coffee
    end
  end

  # GET /sites/:site_id/posts/:id
  def show
    @post = @site.posts.find(params[:id])
  end

  private

  def set_site
    if domain = Domain.find_by_domain(request.host)
      @site = domain.site
    else
      @site = Site.find(params[:site_id])
    end
  end
end
