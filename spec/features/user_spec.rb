require 'rails_helper'

feature 'User can login' do
  scenario "user can click to visit login page" do
    visit '/'
    find('#login').click
    expect(page).to have_content("Username:")
    expect(page).to have_content("Password:")
  end

  scenario "user can log in" do
    visit '/login'
    within("form") do
      fill_in 'Username',:with => "user1"
      fill_in 'Password', :with => "superdogs"
    end
    click_button 'Submit'
    expect(page).to have_content("Welcome, user1")
  end

end
