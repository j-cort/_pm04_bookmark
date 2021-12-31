feature 'Feature: delete_comment' do
  scenario 'user deletes comment' do
    visit ('/')
    click_button 'View Bookmarks'
    within '.makers.bm-comments-button' do
      click_button 'Comments'
    end
    expect(page).to have_content 'great for learning quickly'
    within '#bm-comment-1-delete-button' do
      click_button 'Delete'
    end
    expect(page).not_to have_content 'great for learning quickly'
    expect(page).not_to have_content 'great for learning quickly'
  end
end