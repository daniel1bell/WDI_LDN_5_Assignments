create table todo
(
  id serial4 primary key,
  name varchar(25),
  title varchar(25),
  description varchar(255),
  deadline date,
  status varchar(25),
  created_on timestamp,
  updated_on timestamp
);