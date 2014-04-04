
def menu

  puts `clear`
  puts "\n*** Happitails Animal Shelter ***\n\n"
  puts "1. List Animals" # break out method into 2 steps
  puts "2. List Clients" # break out method into 2 steps
  puts "3. Add a Client"
  puts "4. Adopt Animal" # some animals found, some from clients
  puts "5. Assign Animal"
  puts "Q. Quit"
  puts
  print "Paw me: "
  gets.chomp
end

