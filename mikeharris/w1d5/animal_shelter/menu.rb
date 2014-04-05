def menu
  puts `clear`
  puts "*** Welcome to The Shelter ***"

  puts "1 : List Animals"
  puts "2 : List Clients"
  puts "* : *****"
  puts "4 : Adopt Animal"
  puts "q : Quit"

  print '---> '
  gets.chomp
end


def adopt_animal(shelter)

  if shelter.animals.any?
    puts "Which client wants to adopt and animal"
    puts shelter.list_clients
    print "===> "
    client = gets.chomp

    puts "Which animal would you like to adopt"
    puts shelter.list_animals
    print "===> "
    animal = gets.chomp

    case
      when shelter.clients[client] && shelter.animals[animal] 

        shelter.clients[client].pets[animal] = shelter.animals.delete(animal)

        puts "#{client} has adopted #{animal}. This is the new list of clients:"
        puts shelter.list_clients
      when  shelter.clients[client]
        puts "No animals by that name - start again"
      else
        puts "No client by that name - start again"
    end    

  else
    puts "Sorry no animals in the shelter"
  end  




end

