def deconstruct_test_database
  require 'pg'
  
  "Deleting test database..."
  #Connect to test database 
  db_connect = PG.connect(dbname: 'bookmark_manager_test') 
 
  #Delete bookmarks table
  db_connect.exec("DROP TABLE bookmarks;") 
end