feature 'Feature: view_comments' do
  scenario 'user views comments of a bookmark' do
    visit ('/')
    click_button 'View Bookmarks'
    within '.destroyallsoftware.bm-comments-button' do
      click_button 'Comments'
    end
    expect(page).to have_content 'very entertaining'
  end
end