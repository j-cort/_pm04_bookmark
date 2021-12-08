def setup_test_database
  require 'pg'
  
  p "Setting up test database..."
  
  #Connect to test database
  db_connect = PG.connect(dbname: 'bookmark_manager_test')
  
  #Clear the bookmarks table
  db_connect.exec("TRUNCATE bookmarks;")
end