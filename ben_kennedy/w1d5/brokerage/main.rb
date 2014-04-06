# **Requirements**

# * Create an account for client (name, balance).
# * Every client can create multiple portfolios.
# * A client can buy stocks at market rate; these stocks will be added to a portfolio and the purchase amount subtracted from cash. (You cannot go to a negative cash balance).
# * A client can sell a stock. The proceeds go into his account.
# * List all client portfolios and their values (each portfolio value and sum of portfolio values) and the account balance.
# * List all stocks in a portfolio.
# * List all clients.

# **Note:**

# Each time a portfolio balance is calculated, the program needs to go out to the web and get current stock prices.

# `gem install yahoofinance`
# `YahooFinance::get_standard_quotes('AAPL')['AAPL'].lastTrade`

# `=> 438.62`



# - codes:
#   http://www.eoddata.com/stockList/NASDAQ.htm

require 'pry'
require 'yahoofinance'
require_relative 'menu'
require_relative 'client'

#create inital clients
clients = [ ]
clients << Client.new("Ben", "1000000")
clients << Client.new("Goodwin", "1000")

#Define the menus

main_menu = Menu.new("Welcome to Your Brokerage App",
            c_user: "Create new user",
            l_user: "List users",
            view: "View a user's portfolios"
            q: "Quit program")

user_menu = Menu.new("Portfolios",
            c_port: "Create a new portfolio",
            m_port: "Manage portfolio",
            q: "Quit program" )

portfolio_menu = Menu.new("Manage Portfolio",
            buy: "Buy stocks",
            sell: "Sell stocks"
            q: "Quit program")

response = main_menu.display

while response != :q
  case response
  when :c_user

  when :l_user

  when :view

end

# response = menu.downcase

# while response != 'q'

#   case response
#     when "1"
#       puts s.list_animals

#     when "2"
#       puts s.give_up_animal 

#     when "3"
#       puts s.list_clients

#     when '4'
#       create_new_animal #todo

#     when '5'
#       create_new client # todo

#     when '6'
#       adopt_animal # to do

#     else
#       puts "invalid menue choice"

#   end
#   puts "\n press enter to continue"
#   gets

#   response = menu

# end