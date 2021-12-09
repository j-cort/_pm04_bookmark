require 'pg'

feature 'Feature: delete_bookmark' do
  scenario 'user deletes a bookmark' do
    visit ('/')
    click_button 'See Bookmarks'
    click_button 'Delete google'
    click_button 'See Bookmarks'
    expect(page).not_to have_content "google"
  end
end