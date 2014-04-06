def menu (brokeridge)
  #puts `clear`
  puts "*** #{brokeridge} ***\n\n"
  puts '1 : List Clients'
  puts '2 : Create Client'
  puts '3 : Remove Client'
  puts '4 : Client list portfolios'
  puts '5 : Client add portfolio'
  puts '6 : Client remove portfolio'
  puts '7 : Portfolio list stocks'
  puts '8 : Portfolio buy stock'
  puts '9 : Portfolio sell stock'
  puts "Q : Quit\n\n"
  print '--> '
  gets.chomp
end

def create_client(brokeridge)
  print "Client Name: "
  name = gets.chomp
  print "Balance: "
  balance = gets.to_i
  brokeridge.clients[name] = Client.new(name, balance)
end

def remove_client(brokeridge)
  print "Client Name: "
  name = gets.chomp
  brokeridge.clients.delete(name)
end

def client_list_portfolios(brokeridge)
  print "Client Name: "
  name = gets.chomp
  if brokeridge.clients.has_key?(name)
    brokeridge.clients[name].display_portfolios
  else
    "client not found"
  end
end

def client_add_portfolio(brokeridge)
  print "Client Name: "
  name = gets.chomp
  print "Portfolio Name: "
  portfolio_name = gets.chomp
  brokeridge.clients[name].add_portfolio(portfolio_name)
end

def client_remove_portfolio(brokeridge)
  print "Client Name: "
  client_name = gets.chomp
  print "Portfolio Name: "
  portfolio_name = gets.chomp
  brokeridge.clients[client_name].remove_portfolio(portfolio_name)
end

def portfolio_list_stocks(brokeridge)
  print "Client Name: "
  client_name = gets.chomp
  print "Portfolio Name: "
  portfolio_name = gets.chomp
  puts brokeridge.clients[client_name].portfolios[portfolio_name]
end

def portfolio_buy_stock(brokeridge)
  print "Client Name: "
  client_name = gets.chomp
  print "Portfolio Name: "
  portfolio_name = gets.chomp
  print "Stock code: "
  code = gets.chomp
  print "Stock quantity: "
  quantity = gets.chomp.to_i
  brokeridge.clients[client_name].portfolios[portfolio_name].add_stock(code, quantity)
end

def portfolio_sell_stock(brokeridge)
  print "Client Name: "
  client_name = gets.chomp
  print "Portfolio Name: "
  portfolio_name = gets.chomp
  print "Stock code: "
  code = gets.chomp
  print "Stock quantity: "
  quantity = gets.chomp.to_i
  brokeridge.clients[client_name].portfolios[portfolio_name].remove_stock(code, quantity)
end

def error(message)
  puts message
end