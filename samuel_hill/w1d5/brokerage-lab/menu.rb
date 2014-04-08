def menu
  puts `clear`
  puts "********** Welcome to GA Brokerage ********\n"
  puts
  puts "1\t:\tCreate Client"
  puts "2\t:\tCreate Portfolio"
  puts "3\t:\tPurchase Stocks"
  puts "4\t:\tSell Stocks"
  puts "5\t:\tList Clients"
  puts "6\t:\tList Portfolios"
  puts "7\t:\tCheck Stock Price"
  puts "8\t:\tView Account Balance"
  puts "9\t:\tAdd Money"
  puts "q\t:\tQuit"
  print "---> \t"
  gets.chomp.downcase
end

def lookup_stocks

    puts "Please enter the stock symbol for the stock that you want to look up?:"
    stock_symbol = gets.chomp.upcase

    stock_price = YahooFinance::get_standard_quotes(stock_symbol)[stock_symbol].lastTrade

    puts "The latest price for #{stock_symbol} is #{stock_price}."

  end



