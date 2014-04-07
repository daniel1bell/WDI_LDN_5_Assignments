require 'pry'
require 'yahoofinance'
require_relative 'data'
require_relative 'methods'

require_relative 'stock'
require_relative 'portfolio'
require_relative 'brokerage'
require_relative 'client'

brokerage = Brokerage.new('Arthur Andersen')
setup_brokerage_data(brokerage)

# binding.pry

response = menu
while response != 'q'
  case response
  when '1' then create_client(brokerage)
  when '2' then create_portfolio(brokerage)
  when '3' then purchase_stocks(brokerage)
  when '4' then sell_stocks(brokerage)
  when '5' then list_clients(brokerage)
  when '6' then list_portfolios(brokerage)
  when '7' then list_stocks(brokerage)
  end

  response = menu
end
