def menu
  puts `clear`
  puts "*** SuperTrustee Investments ***"
  puts "\n\nClient Portfolio Management System\n\n"
  puts "1. List Clients"
  puts "2. Add a Client"
  puts "3. Buy Stock for a Client"
  puts "4. Sell Stock for a Client"
  puts "5. Check a Stock Price"
  puts "Q: Quit"
  print "\n| "
  gets.chomp.downcase
end


