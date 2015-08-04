feature "User can write reviews" do
  scenario "People who are not logged in cannot write reviews" do
    visit '/movies/1'
    expect(page).should_not (have_content("Add Your Review"))
  end

  scenario "People who are logged in can write reviews" do
    visit '/login'
    within("form") do
      fill_in 'name',:with => "user1"
      fill_in 'password', :with => "superdogs"
    end
    click_button 'Submit'
    visit '/movies/1'
    expect(page).to have_content("Add Your Review")
  end

end
    # scenario "user can log in" do
    #   visit '/login'
    #   within("form") do
    #     fill_in 'name',:with => "user1"
    #     fill_in 'password', :with => "superdogs"
    #   end
    #   click_button 'Submit'
