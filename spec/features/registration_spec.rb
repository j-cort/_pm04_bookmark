feature 'Feature: registration:' do
  scenario 'user signs up' do
    visit ('/')
    click_button 'Sign Up'
    fill_in 'email', with: 'xyz@abc.com'
    fill_in 'password', with: 'password'
    click_button 'Register'
  
    expect(page).to have_content "Welcome, xyz@abc.com"
  end
end