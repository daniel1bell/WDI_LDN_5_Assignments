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
    print "What stock would you like to buy?\n"
    stock_name = gets.chomp.upcase!
    print "How many shares would you like to buy?\n"
    quantity_of_shares = gets.chomp


    stock_price = YahooFinance::get_standard_quotes('stock_name')['stock_name'].lastTrade



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