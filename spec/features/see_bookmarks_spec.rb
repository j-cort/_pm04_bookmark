require 'pg'

feature 'Viewing Bookmarks' do
  scenario 'user views default bookmarks' do
    #Connect to db
    db_connect = PG.connect(dbname: 'bookmark_manager_test') 
    
    # Add the test data to table
    db_connect.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'makers');")
    db_connect.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'twitter');")
    db_connect.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'google');")
    
    visit ('/')
    click_button 'See Bookmarks'
    
    expect(page).to have_content "1. makers 2. twitter 3. google"
  end
end