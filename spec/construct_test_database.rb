def construct_test_database
  require 'pg'
  
  p "Setting up test database..."
  
  #Connect to test database & create bookmarks table
  db_connect = PG.connect(dbname: 'bookmark_manager_test')
  #Create booknarks table
  db_connect.exec("CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60));")
  #Populate bookmarks table
  db_connect.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'makers');")
  db_connect.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'destroyallsoftware');")
  db_connect.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'google');") 
  
end