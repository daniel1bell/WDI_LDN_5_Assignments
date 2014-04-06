require 'pry'
require 'vine'

# load files
require_relative 'firm'
require_relative 'client'
require_relative 'portfolio'
require_relative 'stock'
require_relative 'menu'


# setup initial data
b = Firm.new('B Firm')

c1 = Client.new('Leo DeCaprio', 100000)
c2 = Client.new('Emma Watson', 8000)
c3 = Client.new('Jennifer Aniston', 5800)

[c1,c2,c3].each do |client|
  b.clients[client.name] = client
end

p1 = Portfolio.new('Investments')
p2 = Portfolio.new('Investments')
p3 = Portfolio.new('Investments')
p4 = Portfolio.new('Retirement')

c1.portfolio[p1.name] = p1
c2.portfolio[p2.name] = p2
c3.portfolio[p3.name] = p3
c3.portfolio[p4.name] = p4

s1 = Stock.new('FSLR', 69.72, 2)
s2 = Stock.new('MMM', 135.86, 1)
s3 = Stock.new('ABT', 38.63, 2)
s4 = Stock.new('ABBV', 52.20, 3)
s5 = Stock.new('ACN', 78.14, 2)
s6 = Stock.new('ACE', 98.39, 1)
s7 = Stock.new('ACT', 201.31, 1)
s8 = Stock.new('ADBE', 61.32, 3)

[s1,s2].each do |stock|
  p1.stocks[stock.name] = stock
end

[s3,s4].each do |stock|
  p2.stocks[stock.name] = stock
end

[s5,s6].each do |stock|
  p3.stocks[stock.name] = stock
end

[s7,s8].each do |stock|
  p4.stocks[stock.name] = stock
end


response = menu.downcase
while response != "q"

  case response
    when '1'
     # Create an account for a client.
     # puts b.list_flats 

    when '2'
      # Create a new portfolio
      # puts b.list_prospects

    when '3'
      #Buy stocks for a client 
      #let_flat(b)

    when '4'    
     #sell stocks for a client 
     #evict_tenant(b)

    when '5'     
     puts b.list_client_info

    when '6' 
     # List all stocks in a client's portfolio   
     puts b.list_stocks_in_a_portfolio
   
    when '7'    
      #List all clients 
      #create_prospect(b)
      b.list_clients
    else
      puts "invalid menu choice."
  end
  puts "\npress enter to continue."
  gets

  response = menu

end