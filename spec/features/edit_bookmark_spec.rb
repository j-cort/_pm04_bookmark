feature 'Feature: edit_bookmark' do
  scenario 'user edits a bookmark' do
    visit ('/')
    click_button 'View Bookmarks'
    within '.makers.bm-edit-button' do
      click_button 'Edit'
    end
    within '.makers.bm-edit-form' do
      fill_in 'new_url', with: 'http://www.bakersacademy.com'
      fill_in 'new_title', with: 'bakers'
      click_button 'Edit'
    end
    expect(page).not_to have_content "makers"
    expect(page).to have_content "bakers"
  end
end