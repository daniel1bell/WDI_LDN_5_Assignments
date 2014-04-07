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
		puts "Please enter the client name."
		client_name = gets.chomp
		puts "Please enter client money."
		client_money = gets.chomp.to_i

		clients[client_name] = Client.new(client_name,client_money)

		puts "#{client_name} has #{client_money} dollars to invest."
	end

	def list_portfolios
		list_clients

		puts "Please enter portfolio to view."
		client_name = gets.chomp
	end

	def create_portfolio
		list_clients
		puts "Please enter client to assign portfolio"
 		client_name = gets.chomp
  		puts "Please enter a portfolio"
		portfolio_name = gets.chomp

		clients[client_name].portfolios[portfolio_name] = Portfolio.new(portfolio_name)

		puts "#{portfolio_name} has been assigned to #{client_name}."
	end

	def purchase_stocks #doesn't work... Sam even helped me...
		list_clients

		puts "Please enter client to purchase stocks."
		client_name = gets.chomp

		puts "Please enter a portfolio to add stocks."
		add_to_portfolio = gets.chomp

		puts "Please enter stock symbol."
		stock_symbol = gets.chomp

		stock_price = YahooFinance::get_standard_quotes(stock_symbol)[stock_symbol].lastTrade.to_i

		puts "#{stock_symbol} is currently valued at #{stock_price}."

		puts "Enter amount of stock to purchase."
		stock_quantity = gets.chomp.to_i

		total_cost = stock_price * stock_quantity

		if total_cost > clients[client_name].balance
			puts "#{client_name} unable to complete trade (lack of funds)."
		else

		clients[client_name].portfolios[add_to_portfolio].stocks = Stock.new(stock_symbol,stock_quantity)

		clients[client_name].balance = clients[client_name].balance - total_cost 

		puts "#{client_name} has added #{stock_quantity} #{stock_symbol} shared to their account."
	
=begin
DOES NOT WORK: LINE 59:in `purchase_stocks': undefined method `lastTrade' for nil:NilClass (NoMethodError)
=end
		end

	end

	def view_balance

   		puts "Please enter client "
		client_name = gets.chomp

		client_balance = clients[client_name].balance

		puts "#{client_name}'s account has a balance of £#{client_balance}."
	end

	def sell_stocks
#cannot do until I get purchase to work
	end  

	def new_funds
		
		puts "Who's account would you like to credit?:"
		client_name = gets.chomp

		puts "How much money is being added?:"
		new_money = gets.chomp.to_i

		clients[client_name].balance = clients[client_name].balance + new_money

		puts "Thanks! Your account has been credited with £#{new_money}."
		puts "Your new balance is £#{clients[client_name].balance}."
	end
end