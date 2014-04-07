require "pry"
require "yahoofinance"

require_relative "menu"
require_relative "client"
require_relative "portfolio"
require_relative "management"
require_relative "stock"


def valediction

  a = "\nWell done, Broseph.\n\n"
  b = "\nFour score and seven years of awesomeness, Abroham Lincoln.\n\n"
  c = "\nRambro, you are crushing it.\n\n"
  d = "\nEpic client management, Brodysseus.\n\n"

  valedictions = [a, b, c, d]
  puts valedictions.sample
end

def check_stock_price
  print "\nPlease enter the symbol for the stock: "
  stock_symbol = gets.chomp.upcase
  stock = YahooFinance::get_standard_quotes(stock_symbol)[stock_symbol]
  stock_price = stock.lastTrade
  stock_name = stock.name
  stock_time = stock.time
  if stock == nil
    puts "\nYou have entered an invalid symbol.\n"
  else
    puts "\nThe price for #{stock_name}'s stock (#{stock_symbol}) as of #{stock_time}(EST) was $#{stock_price}.\n"
  end
end

def is_a_number(s)
    s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end

def number_get_and_confirm(x)
  while !is_a_number(x)
    if x.include?(".")
      print "Please only enter digits: $"
    else
      print "Please only enter digits: "
    end
    x = gets.chomp
  end
  if x.include?(".")
    x.to_f
  else
    x.to_i
  end
end

def confirm_units(units)
  while !is_a_number(units) || units.include?(".") || number_get_and_confirm(units) < 0
    print "\nInvalid entry. Units should be a positive whole number: "
    units = gets.chomp
  end
  units = number_get_and_confirm(units)
  units
end



s1 = Stock.new("AAPL", 30) # for Miranda
s2 = Stock.new("GOOG", 89) # for Miranda
s3 = Stock.new("FB", 17) # for Chandler
s4 = Stock.new("BAC", 120) # for Jack
s5 = Stock.new("F", 953) # for Jack
s6 = Stock.new("RAD", 817) # for Leslie
s7 = Stock.new("BAC", 487) # for Miranda 

p1 = Portfolio.new(:Tech) # for Miranda
p2 = Portfolio.new(:Tech) # for Chandler
p3 = Portfolio.new(:Finance) # for Jack
p4 = Portfolio.new(:Auto) # for Jack
p5 = Portfolio.new(:Fmcg) # for Leslie
p6 = Portfolio.new(:Finance) # for Miranda

c1 = Client.new("Miranda", 1111, 120_000)
c2 = Client.new("Chandler", 2222, 136_000)
c3 = Client.new("Jack", 3333, 208_500)
c4 = Client.new("Leslie", 4444, 109_858)

m = Management.new

[c1, c2, c3, c4].each { |client| m.clients[client.name] = client }

[p1, p6].each { |portfolio| c1.portfolios[portfolio.type] = portfolio }
c2.portfolios[p2.type] = p2
[p3, p4].each { |portfolio| c3.portfolios[portfolio.type] = portfolio }
c4.portfolios[p5.type] = p5

[s1, s2].each { |stock| p1.stocks[stock.stock_symbol] = stock }
p2.stocks[s3.stock_symbol] = s3
p3.stocks[s4.stock_symbol] = s4
p4.stocks[s5.stock_symbol] = s5
p5.stocks[s6.stock_symbol] = s6
p6.stocks[s7.stock_symbol] = s7

response = menu

while response != "q"
  case response
  when "1"
    m.list_clients
  when "2"
    m.add_client
  when "3"
    puts m.buy_stock
  when "4"
    puts m.sell_stock
  when "5"
    check_stock_price
  else
    puts "Invalid choice."
  end
  print "\nPress enter to continue. "
  gets

  response = menu
end

if m.clients.empty?
  exit
else
  valediction
end














