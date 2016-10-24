# this pages controller contains all the code for any page inside pages
class PagesController < ApplicationController
  def index
  end

  def home
  end

  def profile
    #grab username
    if (User.find_by_username(params[:id]))
      @username = params[:id]
    else
      redirect_to root_path, :notice=> "User not found!"
    end

  end

  def explore
  end

end
