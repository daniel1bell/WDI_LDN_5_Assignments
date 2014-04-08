require 'pry-byebug'
def menu
	system "clear" or system "cls"
	puts "Welcome to Happy Tails v.02 (BETA)"
	puts "1: List Animals (works)"
	puts "2: List Adopters (works)"
	puts "3: Adopt an Animal"
	puts "4: Return an Animal"
	puts "5: List Available Animals"
	puts "6: List Potential Adopters"
	puts "7: Create Animal (works)"
	puts "8: Create Adopter (works)"
	puts "q; Quit Program (works)"
	print '---->'
	gets.chomp
end
=begin

=end

def adopt_animal(shelter) #pass the building into this method
	print 'Which person?'
	print "(#{shelter.list_adopters})"
	adopter_name = gets.chomp.downcase
	print 'Which animal?'
	print "(#{shelter.list_animals})"
	animal_name = gets.chomp.downcase



	animal = shelter.animals.delete(animal_name)
	person = shelter.adopters[adopter_name]
			person.animals[animal.name] = animal
		puts "You have placed #{animal_name} into #{person_name}."
end

def evict_tenant(building) #this breaks with my new code a final and i do not know why.
    print 'Which tenant? '
    print "(#{building.list_tenants}) "
    tenant_name = gets.chomp
  tenant = tenants.delete(tenant_name) if flat
  if tenant
    puts "#{building.tenant_name} has been evicted."
  else
    "Sorry, there seems to be a problem evicting, please check your inputs and try again."    
  end
end

