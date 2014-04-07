class Shelter
	attr_accessor :animals, :adopters


	def initialize
		@animals = {}
		@adopters = {}
	end

def list_flats
	flats.keys.join(', ')
end
=begin
def list_possible_adopters
	adopters.keys.join(', ')
	#flats.select { |key, flat| flat.vacant?} old way of doing it
end
=end

def create_adopter #**********
	print "What is the adopter's name?"
	adopter_name = gets.chomp
	print "Whats is the adopter's age?"
	adopter_age = gets.chomp
	print "What is the adopter's gender?"
	adopter_gender = gets.chomp
	print "How many kids does the adopter have?"
	adopter_kids = gets.chomp
	print "How many pets does the adopter have?"
	adopter_pets = gets.chomp
	adopters[adopter_name] = Person.new(adopter_name, adopter_age, adopter_gender, adopter_kids, adopter_pets)
	puts "You have created #{adopter_name}."
	#extra check to make sure it is a unique name
end

def create_animal #works
	print "What is the animals's name?"
	animal_name = gets.chomp.downcase
	print "Whats is the animal's age?"
	animal_age = gets.chomp
	print "What is the animals's breed?"
	animal_breed = gets.chomp.downcase
	print "Whats is the animal's gender?"
	animal_gender = gets.chomp
	print "What is the animals's favorite toy?"
	animal_favtoy = gets.chomp.downcase
	animals[animal_name] = Animal.new(animal_name, animal_age, animal_breed, animal_gender, animal_favtoy)
	puts "You have created #{animal_name}"
end

def list_animals #works
	animals.keys.join(', ')
end

def list_adopters #works
	adopters.keys.join(', ')
end

=begin
def list_tenants
flats.each do |name, flat|
  print flat.tenants.keys.join(', ')
	end
end
=end


end