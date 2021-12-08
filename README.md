# Specifications/User Stories
1. Show a list of bookmarks:
As a web surfer,
So that I can save time,
I'd like to see a list of bookmarked pages


![mvc model](./mvc_model.jpg)

Database Setup
--------------
1. Connect to psql
2. Create the database using the psql command CREATE DATABASE bookmark_manager;
3. Connect to the database using the pqsl command \c bookmark_manager;
4. Run the query we have saved in the file 01_create_bookmarks_table.sql

#insert into table
INSERT INTO bookmarks (url, title) VALUES ('http://www.askjeeves.com', 'askjeeves);

resource
https://github.com/makersacademy/course/blob/main/bookmark_manager/walkthroughs/06.md

TEST Database Setup
--------------
1. Connect to psql
2. Create the database using the psql command CREATE DATABASE bookmark_manager_test;
3. Connect to the database using the pqsl command \c bookmark_manager_test;
4. Run the query we have saved in the file 01_create_bookmarks_table.sql

#insert into table
INSERT INTO bookmarks (url, title) VALUES ('http://www.askjeeves.com', 'askjeeves);