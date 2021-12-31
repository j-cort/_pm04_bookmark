feature 'Feature: authentication:' do
  scenario 'user signs in' do
    visit ('/')
    click_button 'Sign In'
    fill_in 'email', with: 'abc@abc.com'
    fill_in 'password', with: 'password'
    click_button 'Log In'
  
    expect(page).to have_content "Welcome, abc@abc.com"
  end
end