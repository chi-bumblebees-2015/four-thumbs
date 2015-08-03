require 'rails_helper'

feature "User viewing a movie" do
  scenario "when user clicks on a movie from the homepage" do
    visit '/'
    find('#movie-1').click
    expect(page).to have_content(Movie.find(1).name)
  end
end
