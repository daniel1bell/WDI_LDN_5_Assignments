def menu
  puts `clear`
  puts "*** Welcome to your Brokerage  (beta) ***"

  puts "1 : Create Account" #for client (name and balance)
  puts "2 : Create Portfolio" #client creates portfolio
  puts "3 : Buy Stocks" #added to the portfolio and subtracted from cash
  puts "4 : Sell Stocks" #into the account
  puts "5 : List Portfolios" #and their values (each portfolio and the sum of all portfolios and cash = balance)
  puts "6 : List Stocks in a Portfolio" #clear
  puts "7 : List all Clients" #clear
  puts "q : Quit"

  print '---> '
  gets.chomp
end

def create_client(brokerage)
  puts "Welcome, we are glad you want to join us!"
  puts "What is your name?"
  client_name = gets.chomp
  puts "How much cash do you want to add to your account?"
  client_cash = gets.chomp.to_i
  brokerage.clients[client_name] = Client.new(client_name, client_cash)
  puts "Thanks, #{client_name} has been added with GBP #{client_cash}."
end

def create_portfolio(brokerage)
  puts "Which client needs a new portfolio?\n#{brokerage.list_clients}"
  client_name = gets.chomp.capitalize
    if brokerage.clients.has_key?("#{client_name}")
      puts
      puts "#{client_name} currently has the following portfolios:"
      brokerage.clients.fetch("#{client_name}").portfolios.each do |key, value|
        puts key
      end

    puts "What is the name of the new portfolio?"
    portfolio_name = gets.chomp.capitalize

    unless brokerage.clients.fetch("#{client_name}").portfolios.has_key?("#{portfolio_name}")
      brokerage.clients.fetch("#{(client_name)}").portfolios[portfolio_name] = Portfolio.new(portfolio_name)
      puts "Thanks for adding #{portfolio_name} to the client, #{client_name}."
     else 
       puts "You cannot add a new portfolio with an already existing name."
     end
  else 
  puts "The client name was invalid. Please try again."
  end
end 

def buy_stock(brokerage)

  #Name client who wants to buy a stock
  puts "Which client wants to buy a new stock?\n#{brokerage.list_clients}"
  client_name = gets.chomp

  all_clients = brokerage.clients
    puts "You have GBP #{all_clients[client_name].cash} in your account."  

  puts "What is the ticker for the stock you wish to check the value of?"
  stock_ticker = gets.chomp.upcase
  stock_name = YahooFinance::get_standard_quotes(stock_ticker)[stock_ticker].name
  stock_price = YahooFinance::get_standard_quotes(stock_ticker)[stock_ticker].lastTrade

  puts "Stock Ticker: #{stock_ticker}"
  puts "Stock Name: #{stock_name}"
  puts "Last Price: #{stock_price}"

  #show user how much he can buy and let him buy
  potential_value = all_clients[client_name].cash / stock_price 
    puts "You can currently buy #{potential_value}, how many do you want to buy?"
    stock_order = gets.chomp.to_f
      stock_value = stock_order * stock_price
      puts "Thanks you have ordered stock with a value of GBP #{stock_value}."

  #substract order from current balance
  new_balance = all_clients[client_name].cash - stock_value
  all_clients[client_name].cash = new_balance

  #add stock to portfolio
  puts "To which portfolio do you want to add it to?"
  portfolio_name = gets.chomp

  all_clients[client_name].portfolios[portfolio_name].stocks[stock_ticker] = Stock.new(stock_name, stock_ticker, stock_order, stock_value)
  puts "Thanks for adding #{stock_name} with #{stock_ticker} to the #{portfolio_name} portfolio."

end 

def sell_stock(brokerage)

  #Name client who wants to sell some of his stock
  puts brokerage.list_clients
  puts "Which client wants to sell some stocks?"
  client_name = gets.chomp

  #List available stocks
  brokerage.clients[client_name].list_stocks

  #sales process
  puts "Which portfolio do you want to sell from?"
  portfolio_name = gets.chomp

  puts "What´s the ticker of the stock you want to sell?"
  stock_ticker = gets.chomp.upcase
  stock_name = YahooFinance::get_standard_quotes(stock_ticker)[stock_ticker].name
  stock_price = YahooFinance::get_standard_quotes(stock_ticker)[stock_ticker].lastTrade

  puts "What´s the name of the stock you want to sell?"
  stock_name = gets.chomp.capitalize

  client_cash = brokerage.clients[client_name].cash
  
  stock_quantity = brokerage.clients[client_name].portfolios[portfolio_name].stocks[stock_name].quantity

  stock_value = stock_price * stock_quantity 

  #new cash balance
  brokerage.clients[client_name].cash = client_cash - stock_value

  #remove stock
  removed_stock = brokerage.clients[client_name].portfolios[portfolio_name].stocks.delete(stock_ticker)
  puts "Thanks, #{removed_stock} was removed from your portfolio."

 
end





