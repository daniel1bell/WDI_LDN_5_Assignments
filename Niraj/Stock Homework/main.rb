require 'pry'
require 'YahooFinance'

require_relative 'menu'
require_relative 'person'
require_relative 'stocks'
require_relative 'brokerage'
require_relative 'portfolio'

b = Brokerage.new('Brokerage')

c1 = Client.new('John', 200000)
c2 = Client.new('Matt', 300000)
c3 = Client.new('Lilly', 400000)

[c1,c2,c3].each do |client|
  b.clients[client.name] = client
end

p1 = Portfolio.new("Technology")
p2 = Portfolio.new("Science")

c1.portfolios[p1.name] = c1
c2.portfolios[p1.name] = c2
c3.portfolios[p1.name] = c3

b.clients['Sarah'] = Portfolio.new('Aviation')

# binding.pry
# [p1,p2].each do |portfolios|
#   b.portfolios[portfolios.name] = portfolios
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

  else
    puts "Invalid, please try again." 
  end
  puts "\npress enter to continue."
  gets

  response = menu

end
