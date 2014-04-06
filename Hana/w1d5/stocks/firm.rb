require 'pry'
require 'vine'
class Firm
  attr_accessor :name
  attr_reader :clients

  def initialize(name)
       @name = name
       @clients = {}
  end

  def list_client_info
    if clients.any?
      clients.values.join("\n")
    else
      "You have no clients. Go get some!"
    end
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