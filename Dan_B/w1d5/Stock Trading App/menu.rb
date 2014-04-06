def menu
  puts `clear`
  puts "********** Welcome to your Brokerage Management System ********\n"
  puts
  puts
  puts "1\t:\tList Clients"
  puts "2\t:\tView a Client and a Particular Portfolio"
  puts "3\t:\tCheck a Stock Value"
  puts "4\t:\tAdd a Client"
  puts "5\t:\tAdd a Portfolio"
  puts "6\t:\tBuy a Client's Stock"
  puts "7\t:\tSell a Client's Stock"
  puts "q\t:\tQuit"
  puts 
  print "---> \t"
  gets.chomp.downcase
end

