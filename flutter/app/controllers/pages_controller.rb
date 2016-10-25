# this pages controller contains all the code for any page inside pages
class PagesController < ApplicationController
  def index
  end

  def home
    @posts = Post.all
    @newPost = Post.new
  end

  def profile
    #grab username
    if (User.find_by_username(params[:id]))
      @username = params[:id]
    else
      redirect_to root_path, :notice=> "User not found!"
    end

    @posts = Post.all.where("user_id = ?", User.find_by_username(params[:id]).id)
    @newPost = Post.new
  end

  def explore
    @posts = Post.all
  end

end
