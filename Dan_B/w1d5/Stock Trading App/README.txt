**Requirements**

* Create an account for client (name, balance).
* Every client can create multiple portfolios.
* A client can buy stocks at market rate; these stocks will be added to a portfolio and the purchase amount subtracted from cash. (You cannot go to a negative cash balance).
* A client can sell a stock. The proceeds go into his account.
* List all client portfolios and their values (each portfolio value and sum of portfolio values) and the account balance.
* List all stocks in a portfolio.
* List all clients.

**Note:**

Each time a portfolio balance is calculated, the program needs to go out to the web and get current stock prices.

`gem install yahoofinance`
`YahooFinance::get_standard_quotes('AAPL')['AAPL'].lastTrade`

`=> 438.62`



- codes:
  http://www.eoddata.com/stockList/NASDAQ.htm

  # Brokerage
# 'Get Stock (stock_symbol)'
# 'Yahoo (stock_symbol)'
# \Clients
#   \Portfolios
#     \Stocks
#       \ :name, :quantity, :last_trade, :value

puts YahooFinance::get_standard_quotes('AAPL')['AAPL'].lastTrade.round(2)
puts YahooFinance::get_standard_quotes('AAPL')['AAPL'].name