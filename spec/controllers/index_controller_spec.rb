require 'rails_helper'

describe IndexController do

  describe "GET #welcome" do
    it "assigns all movies as @movies" do
      get :welcome
      expect(assigns(:movies)).to eq(Movie.all)
    end
  end
end
