class Brokerage

	attr_accessor :name, :clients

	def initialize(name)

		@name = name
		@clients = {}

	end

	def list_clients
		clients.each do |name,client|
			puts client.name
		end
	end

	def create_client
		puts "What is the Clients name?:"
		client_name = gets.chomp
		puts "How much money does the client want to invest?:"
		client_cash = gets.chomp.to_i

		clients[client_name] = Client.new(client_name,client_cash)

		puts "Thanks! #{client_name} has been added to the system and currently has £#{client_cash} to invest."
	end

	def list_portfolios
		list_clients

		puts "Who's portfolios would you like to view?:"
		client_name = gets.chomp

		 clients[client_name].portfolios.each do |name, portfolio|
				puts "#{client_name} has the following portfolios: #{portfolio.name}."
		end

	end

	def create_portfolio
		list_clients

 		puts "What is the name of the client?:"
  		client_name = gets.chomp
  		puts "What is the name of the portfolio?:"
   		portfolio_name = gets.chomp

    	clients[client_name].portfolios[portfolio_name] = Portfolio.new(portfolio_name)

    	puts "Thanks for creating a new portfolio!"
  	end

  	def purchase_stocks
  		list_clients

  		puts "Which client wishes to purchase stocks?:"
  		client_name = gets.chomp

  		clients[client_name].portfolios.each do |name, portfolio|
				puts "The following portfolios are available: #{portfolio.name}."
			end

  		puts "Which portfolio do they want it to be addded to?:"
  		add_to_portfolio = gets.chomp

  		puts "What is the stock code for the company they wish to purchase?:"
  		stock_symbol = gets.chomp

  		stock_price = YahooFinance::get_standard_quotes(stock_symbol)[stock_symbol].lastTrade.to_i

  		puts "The latest price for #{stock_symbol} is #{stock_price}."

  		puts "How many would they like to purchase?:"
  		stock_quantity = gets.chomp.to_i

  		total_cost = stock_price * stock_quantity

  		if total_cost > clients[client_name].balance
  			puts "#{client_name} does not have enough funds to purchase these stocks."
  		else

  		clients[client_name].portfolios[add_to_portfolio].stocks = Stock.new(stock_symbol,stock_quantity)

  		clients[client_name].balance = clients[client_name].balance - total_cost 

  		puts "Thanks! #{client_name} has just purchased #{stock_quantity} shares in #{stock_symbol}. The total cost for this transaction was £#{total_cost}."

  		puts "The new balance of #{client_name}'s account is £#{clients[client_name].balance}."
  		
  		end

  	end

  	def view_balance
  		list_clients

  		puts "Who's balance would you like to view?:"
  		client_name = gets.chomp

  		client_balance = clients[client_name].balance

  		puts "#{client_name}'s account has a balance of £#{client_balance}."
  	end

  	def sell_stocks
  		list_clients

  		puts "Which client wishes to sell some stocks?:"
  		client_name = gets.chomp

  		clients[client_name].portfolios.each do |name, portfolio|
  			puts portfolio.name
  		end

  		puts "From which portfolio?:"
  		portfolio_name = gets.chomp

  		current_quantity = clients[client_name].portfolios[portfolio_name].stocks.quantity

  		puts "#{client_name} has #{current_quantity} shares in #{clients[client_name].portfolios[portfolio_name].stocks.name}."  

  		puts "Which stock? Please enter stock symbol."
  		stock_symbol = gets.chomp

  		puts "How many would you like to sell?"
  		sell_quantity = gets.chomp.to_i

  		if sell_quantity > clients[client_name].portfolios[portfolio_name].stocks.quantity
  			puts "You do not have this many shares! Please try again."
		
  		else

  		current_price = YahooFinance::get_standard_quotes(stock_symbol)[stock_symbol].lastTrade.to_i

  		money_made = current_price * sell_quantity

  		clients[client_name].balance = clients[client_name].balance + money_made

  		clients[client_name].portfolios[portfolio_name].stocks.quantity = clients[client_name].portfolios[portfolio_name].stocks.quantity - sell_quantity

  		puts "These shares have been sold for £#{money_made} and have been added to #{client_name}'s balance."
  		puts "The new balance for the account is £#{clients[client_name].balance}."
  		end
  	end

 

	def new_funds
		list_clients
		
  		puts "Who's account would you like to credit?:"
  		client_name = gets.chomp

  		puts "How much money is being added?:"
  		new_money = gets.chomp.to_i

  		clients[client_name].balance = clients[client_name].balance + new_money

  		puts "Thanks! Your account has been credited with £#{new_money}."
  		puts "Your new balance is £#{clients[client_name].balance}."
	end
  	
end

  