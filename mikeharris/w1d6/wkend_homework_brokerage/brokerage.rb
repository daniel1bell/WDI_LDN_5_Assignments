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
      #imports stock data either from the internet or from local data
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
    puts "\nCurrent Clients:".underline
    puts clients.keys.join("\n") 
    puts
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
    title =  spacer("Stock", col_width) << spacer("Nos Shares",col_width) << spacer("Avg Price",col_width) << "| " << spacer("Latest Price",col_width) <<  spacer("Total Value",col_width) << spacer("PnL",col_width)

    puts title.underline
    i = 0
    net_worth = 0

    client_portfolio.each_pair do |stock_name, trade_obj|
      i += 1

      current_price = stocks[stock_name][:@lastTrade]
      current_value = trade_obj.nos_shares * current_price
      net_worth += current_value
      profit_loss = (current_price - trade_obj.trade_level) * trade_obj.nos_shares

      output = spacer(stock_name, col_width)   << spacer(trade_obj.nos_shares,col_width)  
      output << spacer(trade_obj.trade_level.round(2),col_width) << "| "<<spacer(current_price, col_width)
      output << spacer(current_value.round(2), col_width)

      if profit_loss < 0 
        output << spacer(profit_loss.round(2),col_width).colorize(:red)
      else 
        output << spacer(profit_loss.round(2), col_width).colorize(:green)
      end
      
      if i == client_portfolio.length
        puts output.underline
      else
        puts output
      end
    end 
    cash =  spacer("Total", col_width * 4 + 2)
    cash << spacer("#{net_worth.round(2)}" , col_width * 2)
    puts cash.underline
    puts"\nYou also have £#{client.show_money.round(2)} in cash giving you a total net worth of £#{(client.show_money + net_worth).round(2)} \n\n"
    
  end

end
