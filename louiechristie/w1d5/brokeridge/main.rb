require 'pry'

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
brokeridge.clients['Bob'].add_portfolio("High risk")
brokeridge.clients['Bob'].add_portfolio("Medium risk")
brokeridge.clients['Bob'].add_portfolio("Low risk")


response = menu(brokeridge)
while response.upcase != 'Q'
  case response
    when '1'
      puts brokeridge.display_clients
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
  end

  response = menu(brokeridge)
end

# start a REPL session
binding.pry
