feature 'Feature: view_bookmarks' do
  scenario 'user views default bookmarks' do
    visit ('/')
    click_button 'View Bookmarks'
    expect(page).to have_content "makers"
    expect(page).to have_content "destroyallsoftware"
    expect(page).to have_content "google"
  end
end