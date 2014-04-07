def menu
  puts `clear`
  puts "*** Welcome to The Animal Shelter  (beta) ***"

  puts "1 : List Animals"
  puts "2 : List Clients"
  puts "3 : Abandon Animal"
  puts "4 : Adopt Animal"
  puts "q : Quit"

  print '---> '
  gets.chomp
end

# def adopt_animal(shelter)
#   puts "Which client wants to adopt an animal?"
#   puts shelter.list_clients
#   client_adopts = gets.chomp

#   puts "Which animal do you want to adopt?"
#   puts shelter.list_animals 
#   animal_to_adopt = gets.chomp

#   shelter.clients.each_value do |value| 
#     if value = client_adopts
#       shelter.animals.each_value do |animal|
#         if animal = animal_to_adopt
#           shelter.clients[client_adopts].pets[animal_to_adopt] = shelter.animals.delete(animal_to_adopt) 
#         else
#           "There is no animal with this name."
#         end
#     else
#       "There is no client with this name."
#     end    
#   end  
# end

def adopt_animal(shelter)
  puts "Which client wants to adopt an animal?"
  puts shelter.list_clients
  client_adopts = gets.chomp

  puts "Which animal do you want to adopt?"
  puts shelter.list_animals 
  animal_to_adopt = gets.chomp

  shelter.clients.each_value do |value| 
    if value = client_adopts
      shelter.animals.each_value do |animal|
        if animal = animal_to_adopt
          shelter.clients[client_adopts].pets[animal_to_adopt] = shelter.animals.delete(animal_to_adopt)   
        else
          "There is no animal with this name."
        end
      end
    else
      "No client"
    end
  end
end

