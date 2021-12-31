feature 'Feature: add_tag' do
  scenario 'user adds tags' do
    visit ('/')
    click_button 'View Bookmarks'
    expect(page).not_to have_content 'career change'
    within '.makers.bm-tags-button' do
      click_button 'Tags'
    end
    within '#add-tag-1' do
      fill_in 'text', with: 'career change'
      click_button 'Add Tag'
    end
    expect(page).to have_content 'career change'
  end
end