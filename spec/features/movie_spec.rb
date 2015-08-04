require 'rails_helper'

feature "User viewing a movie" do
  scenario "when user clicks on a movie from the homepage" do
    visit '/'
    find('#movie-1').click
    expect(page).to have_content(Movie.find(1).name)
  end

  scenario "user can see 'Trusted Reviews'" do
    visit '/movies/1'
    expect(page).to have_content("Trusted Reviews")
  end

  scenario "user can see 'User Reviews'" do
    visit '/movies/1'
    expect(page).to have_content("User Reviews")
  end

  scenario "user can see 'all reviews'" do
    visit '/movies/1'
    expect(page).to have_content ("All Reviews")
  end
end
