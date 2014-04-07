require 'pry'
require 'yahoofinance'

require_relative 'menu'
require_relative 'brokerage'
require_relative 'client'
require_relative 'portfolio'
require_relative 'stock'

s1 = Stock.new("FB", 150, "Facebook, Inc.", 16.3)
s2 = Stock.new("AAPL", 12, "Apple Inc.", 500.2)
s3 = Stock.new("ADSK", 50, "Autodesk, Inc.", 50)
s4 = Stock.new("MSG", 50, "The Madison Squar", 68.2)

p1 = Portfolio.new("Dan p1")
  p1.stocks[s1.code] = s1
  p1.stocks[s3.code] = s3
p2 = Portfolio.new("Dan p2")
p3 = Portfolio.new("Paul p1")
  p3.stocks[s2.code] = s2
  p3.stocks[s4.code] = s4

c1 = Client.new("Dan", 10000.0, "please")
  c1.portfolios[p1.name] = p1
  c1.portfolios[p2.name] = p2
c2 = Client.new("Paul", 15000.0, "please")
  c2.portfolios[p3.name] = p3

b = Brokerage.new("SuperStock")

b_clients = [c1, c2]
b_clients.each {|client| b.clients[client.name] = client}

response = menu
while response != "q"

  case response
  when "1"
    view_client(b)
  when "2"
    stockcheck
  when "3"
    add_client(b)
  when "4"
    add_portfolio(b)
  when "5"
    buy_stock(b)
  when "6"
    sell_stock(b)
  else
    print "Invalid menu choice. Please try again."
  end
puts "\nPress enter to continue."
gets
  response=menu
end


# binding.pry