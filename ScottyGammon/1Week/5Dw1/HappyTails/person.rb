class Person
	attr_accessor :name, :age, :gender, :kids, :animals

def initialize(name, age, gender, kids, animals)
		@name = name
		@age = age
		@gender = gender
		@kids = kids
		@animals = {}
	end
end