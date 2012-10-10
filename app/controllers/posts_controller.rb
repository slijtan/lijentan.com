class PostsController < ApplicationController
  def index
    @posts = Post.where(published: true).order('date_published DESC').limit(10)

    @tac_cup = Post.find_by_title("Levitating Sheep - Multiple Backgrounds for Simple Parallax Effect")
    @tac_cup = Post.first
  end
end
