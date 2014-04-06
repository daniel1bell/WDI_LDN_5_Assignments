require 'pry'
require 'yahoofinance'
class Firm
  attr_accessor :name
  attr_reader :clients

  def initialize(name)
       @name = name
       @clients = {}
  end

  def buy_stocks
    print "For which client?\n"
    print "[#{clients.keys.join(", ")}]\n"
    client_buying_for = gets.chomp

    print "Which portfolio? \n"
    print "[#{clients[chosen_client].portfolio.keys.join(", ")}] \n"
    chosen_portfolio = gets.chomp

    print "What stock would you like to buy?\n"
    stock_name = gets.chomp.upcase!
    
    print "How many shares would you like to buy?\n"
    quantity_of_shares = gets.chomp

    stock_price = YahooFinance::get_standard_quotes('stock_name')['stock_name'].lastTrade

    cost_of_stock_purchase = (quantity_of_shares - stock_price).round(2)

    if clients[client_buying_for].balance >= cost_of_stock_purchase

      clients[client_buying_for].balance -= cost_of cost_of_stock_purchase
      
      clients.fetch(client_buying_for).portfolio.stocks[stock_name] = Stock.new(stock_name, stock_price, quantity_of_shares)
    else
      prints "You do not have enough money to buy that. Sorry about that."
    end

    
  end

  def list_client_info
    print "Which client? \n"
    print "[#{clients.keys.join(", ")}]\n"
    chosen_client = gets.chomp

    clients.fetch(chosen_client).client_info
  end


  def list_stocks_in_a_portfolio
    print "Which client? \n"
    print "[#{clients.keys.join(", ")}]\n"
    chosen_client = gets.chomp

    print "Which portfolio? \n"
    print "[#{clients[chosen_client].portfolio.keys.join(", ")}] \n"
    chosen_portfolio = gets.chomp

    puts clients.fetch(chosen_client).portfolio.values.join("\n")

    # print clients[chosen_client][chosen_portfolio].stocks
 
  end

  def list_clients
    if clients.any?
      puts clients.values.join(", ")
    else
      "You have no clients, go get some!"
    end
  end

end