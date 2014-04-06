require 'pry'
require 'vine'
require 'yahoofinance'

# load files
require_relative 'firm'
require_relative 'client'
require_relative 'portfolio'
require_relative 'stock'
require_relative 'menu'


# setup initial data
b = Firm.new('B Firm')

c1 = Client.new('Harry', 100000)
c2 = Client.new('Hermione', 8000)
c3 = Client.new('Ron', 5800)

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

s1 = Stock.new('FSLR', YahooFinance::get_standard_quotes('FSLR')['FSLR'].lastTrade, 2)
s2 = Stock.new('MMM', YahooFinance::get_standard_quotes('MMM')['MMM'].lastTrade, 1)
s3 = Stock.new('ABT', YahooFinance::get_standard_quotes('ABT')['ABT'].lastTrade, 2)
s4 = Stock.new('ABBV', YahooFinance::get_standard_quotes('ABBV')['ABBV'].lastTrade, 3)
s5 = Stock.new('ACN', YahooFinance::get_standard_quotes('ACN')['ACN'].lastTrade, 2)
s6 = Stock.new('ACE', YahooFinance::get_standard_quotes('ACE')['ACE'].lastTrade, 1)
s7 = Stock.new('ACT', YahooFinance::get_standard_quotes('ACT')['ACT'].lastTrade, 1)
s8 = Stock.new('ADBE', YahooFinance::get_standard_quotes('ADBE')['ADBE'].lastTrade, 3)

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
      add_client(b)

    when '2'
      add_portfolio(b)

    when '3'
      #Buy stocks for a client 
      b.buy_stocks

    when '4'    
     #sell stocks for a client 
      b.sell_stocks

    when '5'     
     puts b.list_client_info

    when '6' 
     # MAKE EDITS List all stocks in a client's portfolio   
     puts b.list_stocks_in_a_portfolio
   
    when '7'    
      b.list_clients
    else
      puts "invalid menu choice."
  end
  puts "\npress enter to continue."
  gets

  response = menu

end