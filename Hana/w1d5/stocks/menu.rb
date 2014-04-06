def menu
  puts `clear`
  puts "*** Welcome to Your Fancy Stock App v.01  (beta) ***"
  puts "1 : Create an account for a client."
  puts "2 : Create a new portfolio."
  puts "3 : Buy stocks for a client."
  puts "4 : Sell stocks for a client."
  puts "5 : List all client information - portfolios and account balance."
  puts "6 : List all stocks in a client's portfolio."
  puts "7 : List all clients."
  puts "q : Quit"
  print '---> '
  gets.chomp
end