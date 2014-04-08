def menu
  puts `clear`
  puts "*** Hapitails Animal Shelter  (beta) ***"
  puts "1 : Add a client"
  puts "2 : Remove a client"
  puts "3 : List all clients"
  puts "4 : Find a client"
  puts "5 : List all animals"
  puts "6 : Donate an animal to the shelter"
  puts "7 : Animal being adopted from the shelter"
  puts "8 : Find an anmial by breed"
  puts "q : Quit"
  print '---> '
  gets.chomp
end