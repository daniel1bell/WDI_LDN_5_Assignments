require 'pry'
 
 require_relative 'tetrapod'
 require_relative 'person'
 require_relative 'animal'
 require_relative 'shelter'
 require_relative 'menu'
 
 shelter = Shelter.new('HappiTails', '10 east 21st Street')
 
 shelter.clients['Bob'] = Person.new('Bob', 22, 'male', 0)
 shelter.clients['Sue'] = Person.new('Sue', 31, 'female', 2)
 shelter.clients['Jil'] = Person.new('Jil', 46, 'female', 1)
 shelter.clients['Sam'] = Person.new('Sam', 87, 'male', 3)
 
 shelter.animals['Spot'] = Animal.new('Spot', 3, 'male', 'Dog')
 shelter.animals['Spot'].toys << 'Bone'
 shelter.animals['Lassy'] = Animal.new('Lassy', 2, 'female', 'Dog')
 shelter.animals['Lassy'].toys << 'Frisbee'
 shelter.animals['Molly'] = Animal.new('Molly', 5, 'female', 'Cat')
 shelter.animals['Molly'].toys << 'Rope'
 shelter.animals['Fido'] = Animal.new('Fido', 8, 'male', 'Dog')
 shelter.animals['Fido'].toys << 'Chew Toy'
 shelter.animals['Sport'] = Animal.new('Sport', 1, 'male', 'Dog')
 shelter.animals['Sport'].toys << 'Treats'
 
 
 response = menu
 while response.upcase != 'Q'
   case response
     when '1'
       puts shelter.display_animals
       gets
     when '2'
       puts shelter.display_clients
       gets
     when '3'
       create_animal shelter
     when '4'
       create_client shelter
     when '5'
       adopt_animal shelter
     when '6'
       return_animal shelter
   end
 
   response = menu
 end