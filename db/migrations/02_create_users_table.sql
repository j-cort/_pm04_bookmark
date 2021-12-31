CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140));

INSERT INTO users (email, password) VALUES ('abc@abc.com', 'password');
INSERT INTO users (email, password) VALUES ('def@abc.com', 'password');
INSERT INTO users (email, password) VALUES ('ghi@abc.com', 'password');

