-- CREATE DATABASE picturehouse_app;

DROP TABLE movies;
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

DROP TABLE categories;
CREATE TABLE categories
(
  id serial4 primary key,
  name varchar(100),
  description text
);

INSERT INTO categories (name, description) values ('Educations Models', 'Clips showing emerging models of educations and how they intend to change the way we approach education.');
INSERT INTO categories (name, description) values ('Teaching Methodology', 'Including new approaches to the methodology of education.');
INSERT INTO categories (name, description) values ('Other', 'A category for all entries that may not fit perfectly into one of the others.');


INSERT INTO movies (title, category, description, url, created_on) values ('The Academy For Global Citizenship', 'Educations Models', 'The Academy for Global Citizenship in Chicago teaches kids about a grander scope than bynomials, Jane Austin or mitochondria: it teaches them how to be contributing citizens of a global society. Run by Sarah Elizabeth Ippel and her team - it''s a brilliant example of emerging education at its finest.', 'http://www.youtube.com/watch?feature=player_embedded&v=rhnyF3jP5ak', current_timestamp);

INSERT INTO movies (title, category, description, url, created_on) values ('Do Schools Kill Creativity?', 'Teaching Methodology', 'Ken Robinson explains his thoughts on creativity in education. He thinks that the modern school system isn''t doing great things for nourishing creativity.', 'http://www.youtube.com/watch?feature=player_embedded&v=iG9CE55wbtY', current_timestamp);

INSERT INTO movies (title, category, description, url, created_on) values ('Shelter From The Storm', 'Teaching Methodology', 'Maria Escudié Reifler is a one of a kind teacher. Just watch to see the love she brings to a classroom and the profound affect it has on the kids.', 'http://www.youtube.com/watch?feature=player_embedded&v=7L83pTjnBZ0', current_timestamp);

INSERT INTO movies (title, category, description, url, created_on) values ('What If Money Was No Object?', 'Other', 'Alan Watts ponders on how controlled our destiny''s are by the fear of making or not making money. He asks what you would do instead of what you''re doing now if money in fact wasn''t a cause for concern. Would it be different?', 'http://www.youtube.com/watch?feature=player_embedded&v=je3rQevW-cw', current_timestamp);

INSERT INTO movies (title, category, description, url, created_on) values ('Democratic Education: Schools Of Trust', 'Educations Models', 'The Schules des Leibens in Germany believe in the principals of democratic education. In this system, curriculum design is done by the kids and teachers become a master of learning instead of being the master of knowledge.', 'http://www.youtube.com/watch?feature=player_embedded&v=pfHrgRITnVM', current_timestamp);
