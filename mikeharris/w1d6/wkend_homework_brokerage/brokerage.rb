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
    puts clients.keys.join('\n') 
  end


 def list_stock_prices
      puts "Ticker  Price"
    stocks.each do |ticker, stock|
      #print ticker , ": ", stock.lastTrade, "   "
      print ticker, ":  ", stock[:@lastTrade], "\n"
    end
  end


end
