require 'rails_helper'

feature "People can write comments" do
  scenario "People who are not logged in cannot write comments" do
    visit '/reviews/1'
    expect(page).to have_content("To comment, you need to login or register for an account.")
  end

  scenario "People who are logged in can write comments" do
    visit '/login'
    within("form") do
      fill_in 'name',:with => "user1"
      fill_in 'password', :with => "superdogs"
    end
    click_button 'Submit'
    visit '/reviews/1'
    within ("form") do
      fill_in "comment_content", :with => "This review seems way too biased for my taste. It ignores the deep subtext involved between the villian and the hero."
      click_button 'Create Comment'
    end
    expect(page).to have_content("This review seems way too biased for my taste. It ignores the deep subtext involved between the villian and the hero.")
  end

end
