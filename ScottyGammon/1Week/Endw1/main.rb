require 'YahooFinance'
require 'pry'

#BIG thanks to Sam. I worked with him on Saturday. He helped me to get lookup stock working
#load files
require_relative 'menu'
require_relative 'brokerage'
require_relative 'client'
require_relative 'portfolio'
require_relative 'stock'

#setup initial data
b = Brokerage.new('WTIT')
c1 = Client.new('Michael',10000)
c2 = Client.new('Alex',7500)
c3 = Client.new('Imran',5000)
c4 = Client.new('Scott',1000)

[c1,c2,c3,c4].each do |client|
	b.clients[client.name] = client
end

p1 = Portfolio.new('Blue Chips')
p2 = Portfolio.new('Growth')

c1.portfolios[p1.name] = p1
c2.portfolios[p2.name] = p2

# run command line interaction
response = menu.downcase
while response != "q"

	case response
		when "1"
 		b.create_client
		when "2"
		b.create_portfolio
		when "3"
		b.purchase_stocks
		when "4"
		b.sell_stocks
		when "5"
		b.list_clients
		when "6"
    	b.list_portfolios
  		when "7"
    	lookup_stocks
    	when "8"
 		b.view_balance
 		when "9"
 		b.new_funds
 		else
 		print "Invalid menu choice. Please try again."
 		end
 		puts "\nPress enter to continue."
 		gets
 		response=menu
end
# binding.pry
# deleted all methods in menu class