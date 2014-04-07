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
require_relative 'position'

#create inital clients
b = Brokerage.new("Ben's Brokerage")

clients = [ ]
clients << Client.new(:Ben, 1000000)
clients << Client.new(:Goodwin, 1000)

clients.each { |client| b.users[client.name] = client }


b.users[:Ben].portfolios["Portfolio ID: 1"] = Portfolio.new("Portfolio ID: 1")
b.users[:Goodwin].portfolios["Portfolio ID: 2"] = Portfolio.new("Portfolio ID: 2")
id = 2

aapl = Security.new('AAPL')
goog = Security.new('GOOG')
appl_position = Position.new(100, aapl)
goog_position = Position.new(100, goog)
b.users[:Ben].portfolios["Portfolio ID: 1"].positions['AAPL'] = appl_position
b.users[:Ben].portfolios["Portfolio ID: 1"].positions['GOOG'] = goog_position

# binding.pry
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
    user = valid_string_input(b.users.keys)
    # binding.pry
    puts " "
    puts b.users[user].list_portfolios 
    puts " "
    response = user_menu.display
    #go int0 the user menu
  when :c_port  
    id = "Portfolio ID: #{id + 1}"
    # binding.pry
    b.users[user].portfolios[id] = Portfolio.create_portfolio(id) 
    puts " "
    puts b.users[user].list_portfolios 
    puts " "
    response = user_menu.display

  when :main
    response = main_menu.display

  when :m_port
    puts "What number portfolio do you want to manage?"
    portfolio = "Portfolio ID: #{valid_number_input}"
    binding.pry
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

