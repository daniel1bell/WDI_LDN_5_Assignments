require 'pry'
require 'yahoofinance'

require_relative 'stock'
require_relative 'portfolio'
require_relative 'client'
require_relative 'brokeridge'
require_relative 'menu'

## Test Data ##

brokeridge = Brokeridge.new('JP Morgan', '10 east 21st Street')

#customers
brokeridge.clients['Bob'] = Client.new('Bob', 22000)
brokeridge.clients['Sue'] = Client.new('Sue', 31000)
brokeridge.clients['Jil'] = Client.new('Jil', 46000)
brokeridge.clients['Sam'] = Client.new('Sam', 87000)

#portfolios
brokeridge.clients['Bob'].add_portfolio("high risk")
brokeridge.clients['Bob'].add_portfolio("medium risk")
brokeridge.clients['Bob'].add_portfolio("low risk")

#stocks
brokeridge.buy_stock("Bob", "high risk", "AAPL", 10)
brokeridge.buy_stock("Bob", "high risk", "AAL", 10)
brokeridge.buy_stock("Bob", "high risk", "ACAS", 10)
brokeridge.buy_stock("Bob", "medium risk", "BABY", 10)
brokeridge.buy_stock("Bob", "medium risk", "BAMM", 10)
brokeridge.buy_stock("Bob", "medium risk", "BANF", 10)
brokeridge.buy_stock("Bob", "low risk", "CAC", 10)
brokeridge.buy_stock("Bob", "low risk", "CACH", 10)
brokeridge.buy_stock("Bob", "low risk", "CAMP", 10)

## End of test data ##

response = menu(brokeridge)
while response.upcase != 'Q'
  case response
    when '1'
      puts brokeridge.list_clients
      gets
    when '2'
      create_client(brokeridge)
      gets
    when '3'
      remove_client(brokeridge)
      gets
    when '4'
      puts list_portfolios(brokeridge)
      gets
    when '5'
      add_portfolio(brokeridge)
      gets
    when '6'
      remove_portfolio(brokeridge)
      gets
    when '7'
      list_stocks(brokeridge)
      gets
    when '8'
      buy_stock(brokeridge)
      gets
    when '9'
      sell_stock(brokeridge)
      gets
  end

  response = menu(brokeridge)
end

#binding.pry
