require 'pry'
require 'yahoofinance'
require 'colorize'

require_relative 'brokerage'
require_relative 'client'
require_relative 'portfolio'
require_relative 'stock'
require_relative 'saved_stock_data'
require_relative 'menu'
require_relative 'data'

#this determines whether to use internet data or not.
$data_setting = false
stock_tickers = ["AAIT","AAL","AAME","ACFN", "ACTS", "GOOG"]

#option to import x number of tickers from file
stock_tickers = import_ticker_file(20)

#this exports tickers to a text file for future use
#export_tickers(stock_tickers)

#set up environment
b = Brokerage.new('NYSE')

c1 = Client.new("Mike", "100000")
c2 = Client.new("Chris","200000")
c3 = Client.new("Noor", "700000")

c1.buy_stock("AAL", 30, 100)
c1.buy_stock("AAME", 4, 100)
c2.buy_stock("AAPL", 450, 100)
c3.buy_stock("ABCB", 50, 20)

b.add_client(c1)
b.add_client(c2)
b.add_client(c3)

b.update_availiable_stocks(stock_tickers)
b.update_stock_data

#main menu system
response = menu.downcase

while response != "q"
  case response 
  when "1" 
    b.list_stock_prices
  when "2"
    log_on(b)
  when "3"
    b.list_clients
    create_client(b)
  when "s"
    settings
    b.update_availiable_stocks(stock_tickers)
    b.update_stock_data
    puts "\nStock prices updated"

  else 
    puts "Invlalid entry try again" 
  end 

  pause

  response = menu.downcase
end



