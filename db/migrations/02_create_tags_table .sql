CREATE TABLE tags(id SERIAL PRIMARY KEY, content VARCHAR(60), bookmark_id INTEGER REFERENCES bookmarks (id));

INSERT INTO tags (content, bookmark_id) VALUES ('coding', '1');
INSERT INTO tags (content, bookmark_id) VALUES ('research', '2');
INSERT INTO tags (content, bookmark_id) VALUES ('travel', '3');
INSERT INTO tags (content, bookmark_id) VALUES ('entertainment', '3');
INSERT INTO tags (content, bookmark_id) VALUES ('tech', '2');
INSERT INTO tags (content, bookmark_id) VALUES ('news', '3');
INSERT INTO tags (content, bookmark_id) VALUES ('tutorials', '2');
INSERT INTO tags (content, bookmark_id) VALUES ('info', '3');
