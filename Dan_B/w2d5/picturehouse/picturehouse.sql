CREATE TABLE movies
(
  id serial4 primary key,
  title varchar(100),
  description text,
  category varchar(100),
  url varchar(100),
  created_on timestamp,
  updated_on timestamp
);