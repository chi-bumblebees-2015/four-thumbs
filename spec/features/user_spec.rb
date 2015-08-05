require 'rails_helper'

feature 'User can login' do
  scenario "user can click to visit login page" do
    visit '/'
    find('#login:first-child').click
    expect(page).to have_content("Username:")
    expect(page).to have_content("Password:")
  end

  scenario "user can log in" do
    visit '/login'
    within("form") do
      fill_in 'name',:with => "user1"
      fill_in 'password', :with => "superdogs"
    end
    click_button 'Submit'
    expect(page).to have_content("Welcome, user1")
  end
end

feature 'User can create new account' do
  scenario "user can click to create account" do
    visit '/'
    find("#new_user").click
    expect(page).to have_content("Username:")
    expect(page).to have_content("Email:")
    expect(page).to have_content("Password:")
    expect(page).to have_content("Password Confirmation:")
  end

  scenario "user can create new account" do
    visit '/users/new'
    within("form") do
      fill_in 'user_name',:with => "treeflex_fan"
      fill_in 'user_email', :with => "treeflex_is_the_best_movie_ever@example.com"
      fill_in 'user_password', :with => "spacecat"
      fill_in 'user_password_confirmation', :with => "spacecat"
    end
    click_button 'Submit'
    expect(page).to have_content("Welcome, treeflex_fan")
  end
end

