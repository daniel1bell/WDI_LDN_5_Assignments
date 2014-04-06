require 'pry'

class Animal
  attr_accessor :name, :age, :favorite_toy
  attr_reader :sex, :breed

def initialize(name, age, sex, breed, favorite_toy) #add optional arguments
  @name = name
  @age = age
  @sex = sex
  @breed = breed
  @favorite_toy = favorite_toy
end

end