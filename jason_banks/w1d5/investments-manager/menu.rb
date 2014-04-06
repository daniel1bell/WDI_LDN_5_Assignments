def menu
  puts `clear`
  puts "*** SuperTrustee Investments ***"
  puts "\n\n'Carrying clients before we carry ourselves since 1901.'\n\n"
  puts "Client Management System\n\n"
  puts "List Clients" # GIVE NO. OF CLIENTS, LIST CLIENTS AND DEETS, GIVE OPTION FOR INCREASING BALANCE, REMOVING, AND, IF TIME, SELLING/BUYING/MOVING STOCK
  puts "Add a Client"
  puts "Buy Stock for a Client"
  puts "Sell Stock for a Client"
  # puts "Move Stock between a Client's Portfolios"
  puts "Check a Stock Price"
  puts "Q: Quit"
  print "\n| "

  # IF TIME, ADD OPTION FOR INFO FOR ALL PORTFOLIOS
  gets.chomp.downcase
end


