class Brokerage
  attr_accessor :name 
  attr_reader  :clients, :stocks

  def initialize(name)
    @name = name
    @stocks = {}
    @clients = {}

  end

  def update_availiable_stocks(stock_tickers)
    stock_tickers.each do |ticker|
      stocks[ticker] = {}
    end
  end

  def update_stock_data
      stocks.each do |ticker , value|
        if $data_setting
          yahoo_stock_obj = YahooFinance::get_standard_quotes("#{ticker}")["#{ticker}"] 
          yahoo_stock_obj.instance_variables.each do |inst_name|
            stocks[ticker][inst_name] = yahoo_stock_obj.instance_variable_get(inst_name)
          end
        else 
          if $saved_stock["#{ticker}"]
            stocks[ticker] = $saved_stock["#{ticker}"]
          else
          stocks.delete(ticker)
          end
        end
      end
  end

  
  def add_client(client)
    clients[client.name] = client
  end

  def list_clients
    puts "\nCurrent Clients:"
    puts clients.keys.join("\n") 
  end

  def show_stock(ticker)
    stocks[ticker]
  end

 def list_stock_prices
    col_width = 8
    print "\n"
    puts (spacer("Ticker", col_width) << spacer("Price",col_width) << spacer("Chg on day",col_width)).underline

    stocks.each do |ticker, stock|
      price = stock[:@lastTrade].to_f
      closing_price = stock[:@open].to_f
      change = (price - closing_price).round(2)
      colour = change < 0 ? :red : :green
      puts spacer(ticker, col_width) << spacer(stock[:@lastTrade],col_width) << (change).to_s.colorize(colour)
    end
  end


def list_client_portfolio(client_name)
  
  client = clients[client_name]
  client_portfolio = client.list_portfolio
  col_width = 15
  puts "\n#{client_name} here's the stocks you currently own:"
  title =  spacer("Stock", col_width) << spacer("Nos Shares",col_width) << spacer("Avg Price",col_width) << "* " << spacer("Latest Price",col_width) <<  spacer("PnL",col_width)
  puts title.underline
  i = 0

  client_portfolio.each_pair do |stock_name, trade_obj|
    i += 1
    output = spacer(stock_name, col_width)   << spacer(trade_obj.nos_shares,col_width)  << spacer(trade_obj.trade_level,col_width) << "* "
     if i == client_portfolio.length
      puts output.underline
    else
      puts output
    end 

  end 
  
 

  pause




end




end
