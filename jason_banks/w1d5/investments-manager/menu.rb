def menu
  puts `clear`
  puts "*** SuperTrustee Investments ***"
  puts "\n\n'Carrying clients before we carry ourselves since 1901.'\n\n"
  puts "Client Management System\n\n"
  puts "1. List Clients"
  puts "2. Add a Client"
  puts "3. Buy Stock for a Client"
  puts "4. Sell Stock for a Client"
  # puts "Move Stock between a Client's Portfolios"
  puts "5. Check a Stock Price"
  puts "Q: Quit"
  print "\n| "

  # IF TIME, ADD OPTION FOR INFO FOR ALL PORTFOLIOS
  gets.chomp.downcase
end


