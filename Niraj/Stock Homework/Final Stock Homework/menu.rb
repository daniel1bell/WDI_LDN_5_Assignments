require 'pry-byebug'

def menu
  system "clear" or system "cls"
  puts "Welcome to Stock Client 1.0"
  puts "1: Create an account"
  puts "2: Create a portoflio"
  puts "3: Buy Stocks"
  puts "4: Sell Stocks"
  puts "5: List portfolios"
  puts "6: List clients"
  puts "7: List stocks"
  puts "q: Quit"
  print '--->'
  gets.chomp
end





