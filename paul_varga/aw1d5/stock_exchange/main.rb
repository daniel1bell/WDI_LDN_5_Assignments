require 'pry'
require 'yahoofinance'

require_relative 'menu'
require_relative 'brokerage'
require_relative 'clients'
require_relative 'portfolio'
require_relative 'stocks'

b = Brokerage.new('Brokerage')

s1 = Stock.new("FB", "Facebook", 10, 350.5)
s2 = Stock.new("MSFT", "Microsoft", 30, 40)
s3 = Stock.new("GSK", "GlaxoSmithKline", 40, 52)
s4 = Stock.new("AMGN", "Amgen", 100, 120)
s5 = Stock.new("IIA", "Immofinanz", 500, 3.5)

p1 = Portfolio.new('Tech')
  p1.stocks[s1.name] = s1
  p1.stocks[s2.name] = s2
p2 = Portfolio.new('Healthcare')
  p2.stocks[s3.name] = s3
  p2.stocks[s4.name] = s4
p3 = Portfolio.new('Real Estate')
  p3.stocks[s5.name] = s5

c1 = Client.new('Louie', 100000)
  c1.portfolios[p1.name] = p1
  c1.portfolios[p2.name] = p2

c2 = Client.new('Mike', 70000)
  c2.portfolios[p3.name] = p3

[c1, c2].each do |client|
  b.clients[client.name] = client
end 

b.clients[c1.name] = c1
b.clients[c2.name] = c2


response = menu.downcase
while response != 'q'
  case response
  when '1'
    create_client(b) 
  when '2'
    create_portfolio(b)
  when '3'
    buy_stock(b) #TD
  when '4'
    sell_stock(b) #TD
  when '5'
    b.list_portfolio
  when '6'
    c1.list_stocks
  when '7'
    puts b.list_clients
  else
    puts "invalid menu choice" 
  end
  puts "\npress enter to continue."
  gets

  response = menu

end



binding.pry