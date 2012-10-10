class PostsController < ApplicationController
  def index
    @posts = Post.where(published: true).order('date_published DESC')

    @tac_cup = Post.find_by_title("Levitating Sheep - Multiple Backgrounds for Simple Parallax Effect")
    #@tac_cup = Post.find_by_title("Summatime in the SFC")
  end
end
