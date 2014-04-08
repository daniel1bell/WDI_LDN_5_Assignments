class Animal

attr_accessor :name, :species, :gender, :age

def initialize(name, species, gender, age)
    @name = name
    @species = species
    @gender = gender
    @age = age
end

def to_s
  "#{name}, #{species}, #{gender}, #{age}"
end


end