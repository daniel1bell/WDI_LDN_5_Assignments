class Actor < ActiveRecord::Base
  has_many :through
  attr_accessible :actor_image, :imdb_link, :name
end
