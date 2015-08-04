require 'rails_helper'

feature 'User can login' do
  scenario "user can click to visit login page" do
    visit '/'
    find('#login').click
    expect(page).to have_content("Username:")
    expect(page).to have_content("Password:")
  end
end
