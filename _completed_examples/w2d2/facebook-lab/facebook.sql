DROP TABLE people;

CREATE TABLE people
  (
    id serial8 primary key,
    first varchar(20) not null,
    last varchar(20) not null,
    dob date check (dob < '1/1/2000'),
    relationship varchar(50),
    friends int2 default 0,
    city varchar (20)
  );