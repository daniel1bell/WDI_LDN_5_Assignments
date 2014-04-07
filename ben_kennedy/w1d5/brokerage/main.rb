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
require_relative 'portfolios'
require_relative 'securities'
require_relative 'navigation'
require_relative 'brokerage'

#create inital clients
b = Brokerage.new("Ben's Brokerage")

clients = [ ]
clients << Client.new("Ben", "1000000")
clients << Client.new("Goodwin", "1000")

clients.each { |client| b.users[client.name] = client }

portfolios = { }
positions = { }

id = 1

#Define the menus

main_menu = Menu.new("Welcome to Your Brokerage App, Main Menu",
            c_user: "Create new user",
            l_user: "List users",
            view: "View a user's portfolios",
            q: "Quit program")

user_menu = Menu.new("Portfolios Overview",
            c_port: "Create a new portfolio",
            m_port: "Manage portfolio",
            main: "Back to the Main Menu",
            q: "Quit program" )

portfolio_menu = Menu.new("Manage Portfolio",
            buy: "Buy stocks",
            sell: "Sell stocks",
            port_overview: "Back to the Portfolios Overview Menu",
            q: "Quit program")
            

response = main_menu.display

while response != :q
  case response
  when :c_user
    new_user = Client.create_user
    b.users[new_user.name] = new_user 
    response = main_menu.display
  
  when :l_user
    
    puts " " 
    puts b.list_users
    puts " "
    response = main_menu.display
  
  when :view
    puts "What user's portfolios do you want to view?"
    user = valid_string_input(b.clients.keys)
    user.list_portfolios #todo
    response = user_menu.display
    #go int0 the user menu
  when :c_port  
    id = id + 1
    Portfolio.create_portfolio(id) 
    response = user_menu.display

  when :main
    response = main_menu.display

  when :m_port
    portfolio = lookup("portfolio", portfolios)#todo
    portfolio.list_positions #todo
    response = portfolio_menu.display #to do
  
  when :buy
  portfolios.buy_securities #todo
  response = portfolio_menu.display
  
  when :sell
  portfolios.sell_securities #todo
  response = portfolio_menu.display
  
  when :port_overview
  response = user_menu.display 

  end



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