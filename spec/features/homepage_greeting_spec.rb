feature 'Homepage Greeting' do
  scenario 'greets user with Hello World!' do
    visit ('/')
    expect(page).to have_content 'Hello World!'
  end
end