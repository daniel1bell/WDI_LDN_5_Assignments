def menu
  puts `clear`
  puts "*** SuperTrustee Investments ***"
  puts "\n\n'Carrying clients before we carry ourselves since 1901.'\n\n"
  puts "Client Management System\n\n"
  puts "List Clients"
  puts "Sell Stock for a Client"
  puts "Buy Stock for a Client"
  puts "Move Stock between a Client's Portfolios"
  puts "Check a Stock Price"
  puts "Quit"
  puts "\n| "
  gets.chomp.downcase
end

