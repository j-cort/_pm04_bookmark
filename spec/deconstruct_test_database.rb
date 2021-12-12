def deconstruct_test_database
  require 'pg'
  
  p "Deleting test database..."
  
  #Connect to test database 
  db_connect = PG.connect(dbname: 'bookmark_manager_test')
  
  #Delete bookmarks table
  db_connect.exec("DROP TABLE comments;")  
  db_connect.exec("DROP TABLE bookmarks;")  
end