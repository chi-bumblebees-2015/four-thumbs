class IndexController < ApplicationController

  def welcome
    @movies = Movie.all
    if session[:user_id]
      @name = User.find(session[:user_id])
    end
  end


end
