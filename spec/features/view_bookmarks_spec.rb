require 'pg'

feature 'Feature: view_bookmarks' do
  scenario 'user views default bookmarks' do
    visit ('/')
    click_button 'See Bookmarks'
    expect(page).to have_content "1. makers"
    expect(page).to have_content "2. destroyallsoftware"
    expect(page).to have_content "3. google"
  end
end