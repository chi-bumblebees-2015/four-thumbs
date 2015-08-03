class IndexController < ApplicationController

  def welcome
    @movies = Movie.all
  end

end
