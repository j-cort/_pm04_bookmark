require 'pg'

feature 'Adding Bookmarks' do
  scenario 'user adds a new bookmark' do
    visit ('/')
    click_button 'Add Bookmark'
    fill_in 'url', with: 'https://stackoverflow.com/'
    fill_in 'title', with: 'stackoverflow'
    click_button 'Submit'
    click_button 'See Bookmarks'
    expect(page).to have_content "1. makers 2. destroyallsoftware 3. google 4. stackoverflow"
  end
end