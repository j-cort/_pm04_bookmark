require 'pg'

feature 'Feature: delete_bookmark' do
  scenario 'user deletes a bookmark' do
    visit ('/')
    click_button 'View Bookmarks'
    within '.google.bm-delete-button' do
      click_button 'Delete'
    end
    click_button 'View Bookmarks'
    expect(page).not_to have_content "google"
  end
end