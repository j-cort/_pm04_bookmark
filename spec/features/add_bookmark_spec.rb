require 'pg'

feature 'Feature: add_bookmark:' do
  scenario 'user adds a new bookmark' do
    visit ('/')
    click_button 'Add Bookmark'
    fill_in 'url', with: 'https://stackoverflow.com/'
    fill_in 'title', with: 'stackoverflow'
    click_button 'Submit'
    click_button 'See Bookmarks'
    expect(page).to have_content "1. makers"
    expect(page).to have_content "2. destroyallsoftware"
    expect(page).to have_content "3. google"
    expect(page).to have_content "4. stackoverflow"
  end
end