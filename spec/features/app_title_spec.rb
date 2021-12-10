feature 'Feature: present_app' do
  scenario 'displays app title on homepage' do
    visit ('/')
    expect(page).to have_content 'Basic Bookmarks'
  end
end