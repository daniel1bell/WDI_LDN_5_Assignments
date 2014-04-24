class Medium < ActiveRecord::Base
  has_and_belongs_to_many :genre
  attr_accessible :imdb_link, :movie_image, :name, :type
end
