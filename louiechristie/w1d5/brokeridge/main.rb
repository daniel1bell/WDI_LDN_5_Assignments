require 'pry'
require 'yahoofinance'

require_relative 'stock'
require_relative 'portfolio'
require_relative 'client'
require_relative 'brokeridge'
require_relative 'menu'

brokeridge = Brokeridge.new('JP Morgan', '10 east 21st Street')

brokeridge.clients['Bob'] = Client.new('Bob', 22000)
brokeridge.clients['Sue'] = Client.new('Sue', 31000)
brokeridge.clients['Jil'] = Client.new('Jil', 46000)
brokeridge.clients['Sam'] = Client.new('Sam', 87000)

#portfolios new
brokeridge.clients['Bob'].add_portfolio("high risk")
brokeridge.clients['Bob'].add_portfolio("medium risk")
brokeridge.clients['Bob'].add_portfolio("low risk")

#stocks
brokeridge.clients['Bob'].portfolios["high risk"].add_stock("AAPL", 10)
brokeridge.clients['Bob'].portfolios["high risk"].add_stock("AAL", 20)
brokeridge.clients['Bob'].portfolios["high risk"].add_stock("ACAS", 1)


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
      puts client_list_portfolios(brokeridge)
      gets
    when '5'
      client_add_portfolio(brokeridge)
      gets
    when '6'
      client_remove_portfolio(brokeridge)
      gets
    when '7'
      portfolio_list_stocks(brokeridge)
      gets
    when '8'
      portfolio_buy_stock(brokeridge)
      gets
    when '9'
      portfolio_sell_stock(brokeridge)
      gets
  end

  response = menu(brokeridge)
end

#binding.pry
