class HomeController < ApplicationController
  def index
    @posts = Post.where(published: true).order('date_published DESC')

    @tac_cup = Post.find_by_title("Object In Nature - Session 2")
  end
end
