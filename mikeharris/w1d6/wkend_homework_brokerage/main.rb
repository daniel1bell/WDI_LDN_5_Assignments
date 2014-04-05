require 'pry'
require 'yahoofinance'
require 'colorize'

require_relative 'brokerage'
require_relative 'client'
require_relative 'portfolio'
require_relative 'stock'
require_relative 'saved_stock_data'
require_relative 'menu'

data_setting = true

stock_tickers = ["AAIT","AAl" ,"AAME"]



b = Brokerage.new('NYSE')

b.update_availiable_stocks(stock_tickers)
b.update_stock_data




response = menu.downcase

while response != "q"
  case response 
  when "1" 
    b.list_stock_prices
  when "2" 
    
  when "3"
    
  when "4"
  
  when "s"
    data_setting = settings(data_setting)
  else 
    puts "Invlalid entry try again - hit enter to continue"
    
  end 
  print "\nHit Enter to continue"
  gets  

  response = menu
end


binding.pry