require 'pry'

#loaded some files
require_relative 'animal'
require_relative 'shelter'
require_relative 'person'
require_relative 'menu'


#set up initial data
b = Shelter.new
a1 = Animal.new('buddy','10', 'male', 'dog', 'bone')
a2 = Animal.new('duke','8', 'male', 'dog', 'ball')
a3 = Animal.new('lady','3', 'female', 'cat', 'ball')
a4 = Animal.new('julien','4', 'male', 'cat', 'mouse')
a5 = Animal.new('spike','5', 'male', 'dog', 'babies')
p1 = Person.new('Billy', '12', 'male', '0', 0)
p2 = Person.new('Jason', '35', 'male', '1', 2)
p3 = Person.new('Samantha', '42', 'female', '3', 1)


[a1,a2,a3,a4,a5].each do |animal|
	b.animals[animal.name] = animal
end

[p1,p2,p3].each do |adopter|
	b.adopters[adopter.name] = adopter

	end

=begin
f1.tenants[p1.name] = p1
f1.tenants[p2.name] = p2
f2.tenants[p3.name] = p3

b.prospects[p4.name] = p4
=end

#run command line interaction
response = menu.downcase
while response != "q"

	case response
	when 1.to_s
		puts b.list_animals 
	when 2.to_s
		puts b.list_adopters
	when 3.to_s
		adopt_animal(b)
	when 4.to_s
		return_animal(b) #todo- write this method
	when 5.to_s
		puts b.list_available_animals
	when 6.to_s
		puts b.list_potential_adopters
	when 7.to_s
		b.create_animal
	when 8.to_s
		b.create_adopter
	end

gets
	response = menu
end