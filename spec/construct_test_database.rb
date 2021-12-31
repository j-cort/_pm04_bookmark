def construct_test_database
  require 'pg'
  
  p "Setting up test database..."
  
  #Connect to test database & create bookmarks table
  db_connect = PG.connect(dbname: 'bookmark_manager_test')
  #Create bookmarks table
  db_connect.exec("CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60) ON DELETE CASCADE ON UPDATE CASCADE);")
  #Create comments table
  db_connect.exec("CREATE TABLE comments(id SERIAL PRIMARY KEY, text VARCHAR(240), bookmark_id INTEGER REFERENCES bookmarks (id) ON DELETE CASCADE ON UPDATE CASCADE);")
  #Create tags table
  db_connect.exec("CREATE TABLE tags(id SERIAL PRIMARY KEY, content VARCHAR(60), bookmark_id INTEGER REFERENCES bookmarks (id) ON DELETE CASCADE ON UPDATE CASCADE);")
  #Create user table
  db_connect.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140));")

  #Populate bookmarks table
  db_connect.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'makers');")
  db_connect.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'destroyallsoftware');")
  db_connect.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'google');") 
  #Populate comments table
  db_connect.exec("INSERT INTO comments (text, bookmark_id) VALUES ('great for learning quickly', '1');")
  db_connect.exec("INSERT INTO comments (text, bookmark_id) VALUES('very entertaining', '2');")
  db_connect.exec("INSERT INTO comments (text, bookmark_id) VALUES('informative and conveninent', '3');") 
  #Populate tags table
  db_connect.exec("INSERT INTO tags (content, bookmark_id) VALUES ('coding', '1');")
  db_connect.exec("INSERT INTO tags (content, bookmark_id) VALUES ('research', '2');")
  db_connect.exec("INSERT INTO tags (content, bookmark_id) VALUES ('travel', '3');") 
  db_connect.exec("INSERT INTO tags (content, bookmark_id) VALUES ('entertainment', '3');")
  db_connect.exec("INSERT INTO tags (content, bookmark_id) VALUES ('tech', '2');")
  db_connect.exec("INSERT INTO tags (content, bookmark_id) VALUES ('news', '3');") 
  db_connect.exec("INSERT INTO tags (content, bookmark_id) VALUES ('tutorials', '2');")
  db_connect.exec("INSERT INTO tags (content, bookmark_id) VALUES ('info', '3');") 
  #Populate users table
  db_connect.exec("INSERT INTO users (email, password) VALUES ('abc@abc.com', 'password');")
  db_connect.exec("INSERT INTO users (email, password) VALUES ('def@abc.com', 'password');")
  db_connect.exec("INSERT INTO users (email, password) VALUES ('ghi@abc.com', 'password');")

end