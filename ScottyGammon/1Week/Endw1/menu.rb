def menu
	puts `clear`
	puts "*** Welcome to World Takeover / Investment Trading v.01 ***"
	puts
	puts "1 : Create New Client" #works
	puts "2 : Create New Portfolio" #works
	puts "3 : Create New Stock Purchase (NOT WORKING)" 
	puts "4 : Create New Stock Sale (NOT WORKING)"
	puts "5 : List Current Clients" #works
	puts "6 : List Current Portfolios (NOT WORKING)"
	puts "7 : Check Current Stock Price"
	puts "8 : View Account Balance"#works
	puts "9 : Credit a Client" #works
	puts "q : Quit"
	print "---> "
	gets.chomp.downcase
end

def lookup_stocks
	puts "What is the symbol of the stock?"
	stock_symbol = gets.chomp.upcase

	stock_price = YahooFinance::get_standard_quotes(stock_symbol)[stock_symbol].lastTrade

	puts "#{stock_symbol} is trading at #{stock_price} dollars (delayed 15 minutes)."
end