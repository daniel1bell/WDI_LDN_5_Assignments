CREATE TABLE categories
(
  id serial4 primary key,
  name varchar(255) not null
);

CREATE TABLE portfolios
(
  id serial4 primary key,
  name varchar(255) not null,
  description text,
  created_at timestamp,
  category_id integer
);

CREATE TABLE stocks
(
  id serial4 primary key,
  symbol varchar(10) not null,
  name varchar(255),
  holding integer,
  bought_price decimal,
  created_on timestamp,
  portfolio_id integer
);