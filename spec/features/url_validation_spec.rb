feature 'Feature: url_validation:' do
  scenario 'user receives an error message when invalid url is entered' do
    visit ('/')
    click_button 'View Bookmarks'
    within '.add-container' do
      fill_in 'url', with: 'invalidurl'
      fill_in 'title', with: 'invalidurl'
      click_button 'Submit'
    end
    expect(page).not_to have_content "invalidurl"
    expect(page).to have_content "Please enter a valid url!"
  end

end