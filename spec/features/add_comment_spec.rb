feature 'Feature: add_comment' do
  scenario 'user adds comments' do
    visit ('/')
    click_button 'View Bookmarks'
    expect(page).not_to have_content 'top coding bootcamp'
    within '.makers.bm-comments-button' do
      click_button 'Comments'
    end
    within '#add-comment-1' do
      fill_in 'text', with: 'top coding bootcamp'
      click_button 'Add Comment'
    end
    expect(page).to have_content 'top coding bootcamp'
  end
end