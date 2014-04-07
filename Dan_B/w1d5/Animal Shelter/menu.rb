def menu
  puts `clear`
  puts "********** Welcome to your Pet Management System ********\n"
  puts
  puts
  puts "1\t:\tList Available Pets"
  puts "2\t:\tList Clients"
  puts "3\t:\tList Prospects"
  puts "4\t:\tAdd Prospects"
  puts "5\t:\tAdd a Pet"
  puts "6\t:\tReceive Abandoned Pet"
  puts "7\t:\tReHome a Pet"
  puts "q\t:\tQuit"
  puts 
  print "---> \t"
  gets.chomp.downcase
end

def add_prospect(shelter)
  print "What is the prospect name? "
  prospect_name = gets.chomp.capitalize
  print "What is the prospect's phone number? "
  prospect_phone = gets.chomp

  shelter.clients[prospect_name] = Person.new(prospect_name, prospect_phone)
  puts "Thanks for adding #{prospect_name} as a new prospect."
end

def add_pet(shelter)
  print "What is the pet's name? "
  pet_name = gets.chomp.capitalize
  print "What is the pet's breed? "
  pet_breed = gets.chomp.capitalize
  print "What is the pet's age? "
  pet_age = gets.chomp
  print "What is the pet's gender? "
  pet_gender = gets.chomp.capitalize
  print "What is #{pet_name}'s favourite toy? "
  pet_toy = gets.chomp
  shelter.animals[pet_name] = Animal.new(pet_name, pet_breed, pet_age, pet_gender, pet_toy)
  puts "Thanks for adding #{pet_name} as a new pet. We sure will look after them."
end

def abandon_pet(shelter)
  shelter.list_clients
  puts "\nWhich client would lke to abandon a pet?"
  nasty_client = gets.chomp
  puts

  if shelter.clients.has_key?("#{nasty_client}")
    shelter.clients.fetch("#{nasty_client}").pets.each {|name, values| puts values}
    puts "\nWhich pet would they like to abandon to the shelter?"
    poor_pet = gets.chomp

    if shelter.clients.fetch("#{nasty_client}").pets.has_key?("#{poor_pet}")
      
      pet = shelter.clients.fetch("#{nasty_client}").pets.delete("#{poor_pet}")

      shelter.animals[pet.name] = pet
      puts "Thank you. We've received #{poor_pet} to the shelter and it is now listed with the available pets."
      puts
      print shelter.list_available_pets
    else
      puts "The pet name was invalid. Please try again."
    end
  else
    puts "The client name was invalid. Please try again."
  end
end

def rehome_pet(shelter)
  shelter.list_available_pets
  puts "\nWhich pet would you like to rehome?"
  lucky_pet = gets.chomp
  puts

  if shelter.animals.has_key?("#{lucky_pet}")
    shelter.list_clients_prospects
    puts "Which of the current clients or new prospects will be rehoming a pet?"
    good_prospect = gets.chomp
    if shelter.clients.has_key?("#{good_prospect}")
      rehomed_pet = shelter.animals.delete("#{lucky_pet}")
      shelter.clients.fetch("#{good_prospect}").pets[rehomed_pet.name] = rehomed_pet
      puts "Thank you! We have now removed #{lucky_pet} from the shelter and placed it with #{good_prospect}"
      puts
      print shelter.clients["#{good_prospect}"]
    else
      puts "The prospect name was invalid. Please try again."
    end

  else
    puts "That pet name was invalid. Please try again"
  end
end