require 'pry'
require 'yahoofinance'
require 'colorize'

require_relative 'brokerage'
require_relative 'client'
require_relative 'portfolio'
require_relative 'stock'
require_relative 'saved_stock_data'
require_relative 'menu'

$data_setting = false

stock_tickers = ["AAIT","AAL","AAME"]

b = Brokerage.new('NYSE')
c1 = Client.new("Mike", "100000")

c1.buy_stock("AAL", 30, 100)
c1.buy_stock("AAME", 1, 90)

b.add_client(c1)



b.update_availiable_stocks(stock_tickers)
b.update_stock_data

response = menu.downcase

while response != "q"
  case response 
  when "1" 
    b.list_stock_prices
    pause
  when "2" 
    b.update_stock_data
  when "3"
    b.list_clients
    pause
  when "4"
    b.list_clients
    create_client(b)
    pause
  when "5"
    list_portfolio(b)
  when "6"
    log_on(b)
  when "s"
    settings
    b.update_availiable_stocks(stock_tickers)
    b.update_stock_data

  else 
    puts "Invlalid entry try again"
    
  end 
    

  response = menu.downcase
end


binding.pry