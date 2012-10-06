class HomeController < ApplicationController
  def index
    @posts = Post.where(published: true).order('date_published DESC').limit(5)

    @tac_cup = Post.find_by_title("Levitating Sheep - Multiple Backgrounds for Simple Parallax Effect")
    #@tac_cup = Post.find_by_title("The Tac Cup")
  end
end
