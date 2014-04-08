class Brokerage

  attr_accessor :name, :clients, :portfolios

  def initialize(name)
    @name = name
    @clients = {}
    @portfolio = {}
  end


def list_clients
  clients.each do |name, client|
    puts "#{name}"
  end
# else
#   puts "There are no clients currently stored in the database"
end
   
def create_account
  print "What is your name?" 
  client_name = gets.chomp("\n")
  print "How much money would you like to add to your account?"
  client_cash = gets.to_f
  print "#{client_name} has been added to the database and #{client_cash} has been deposited to the account"
  clients[client_name] = Client.new(client_name, client_cash)
end

def create_portfolio
  puts "Who would you like to create a portfolio for?"
  list_clients
  portfolio_for = gets.chomp
  print "Name of portfolio?"
  portfolio_name = gets.chomp
  print "#{portfolio_name} has been added to #{portfolio_for}'s account"
  # clients[portfolio_for] = Portfolio.new(portfolio_for, portfolio_name)
end

 def list_portfolio
   # binding.pry
      clients.each do |name, client| #puts client.name
        
        if clients.portfolios
          clients.portfolios.each do |name, type| 
             puts portfolios
          end 
        else 
          puts "#{name} has no portfolio"
        end
      end
  end

  def live_stocks
    puts "Name of client you would like to buy stocks for?"
    list_clients
    stock_buyer = gets.chomp

    puts "Which company would you like to invest in"
     stock_name = gets.chomp
    current_price = 2 
    print "How many stocks would you like to buy?"
     stock_amount = gets.to_i
    
    stock_value = current_price * stock_amount

    print "#{stock_buyer} has brought #{stock_amount} stocks for #{stock_name} for GDP #{stock_value} "

  end


end



