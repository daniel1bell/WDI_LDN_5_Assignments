require 'pry'
require 'yahoofinance'

# Brokerage
# 'Get Stock (stock_symbol)'
# 'Yahoo (stock_symbol)'
# \Clients
#   \Portfolios
#     \Stocks
#       \ :name, :quantity, :last_trade, :value

puts YahooFinance::get_standard_quotes('AAPL')['AAPL'].lastTrade.round(2)
puts YahooFinance::get_standard_quotes('AAPL')['AAPL'].name
binding.pry
gets