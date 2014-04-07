require 'pry'
require 'YahooFinance'

require_relative 'menu'
require_relative 'person'
require_relative 'stocks'
require_relative 'brokerage'
require_relative 'portfolio'

b = Brokerage.new('Brokerage')


s1 = Stock.new("GOOG", "Google", 400)
s2 = Stock.new("MSOF", "Microsoft", 150)


p1 = Portfolio.new("John p1")
  p1.stocks[s1.name] = s1
  p1.stocks[s2.name] = s2

p2 = Portfolio.new("Matt p2")
  p2.stocks[s1.name] = s1


c1 = Client.new('John', 200000)
  # c1.portfolios[p1.name] = p1
  # c1.portfolios[p2.name] = p2
# c2 = Client.new('Matt', 300000)
#   c2.portfolios[p2.name] = p3

# b_clients =[c1, c2]
b_clients = [c1]
b_clients.each {|client| b.clients[client.name] = client}


# [c1,c2,c3].each do |client|
#   b.clients[client.name] = client
# end





response = menu.downcase
while response != 'q'
  case response
  when '1'
    b.create_account #TD
  when '2'
    b.create_portfolio #TD
  when '3'
    b.live_stocks #TD
  when '4'
    sell_stock(b1) #TD
  when '5'
     b.list_portfolio #TD
  when '6'
     b.list_clients #TD
   when '7'
    b.list_stocks

  else
    puts "Invalid, please try again." 
  end
  puts "\npress enter to continue."
  gets

  response = menu

end
