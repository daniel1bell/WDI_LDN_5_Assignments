def menu
  puts `clear`
  puts "*** Mike's Brokerage Exchange ***"
  puts "\n\n"
  print "Curently "
  print !$data_setting ? "not " : ""
  puts "using internet data"  
  puts "To change goto settings"
  puts "\n\n"
  puts "1 : List stocks on the exchange"
  puts "2 : Log on as a client to view portfolio and trade"
  puts "3 : Add a CLient"
  puts "\ns : Settings"
  puts "q : Quit"
  print '---> '
  gets.chomp
end

def client_menu
  puts "1 : Show and value portfoliio"
  puts "2 : Buy a stock"
  puts "3 : Sell a stock"
  puts "\nq : Log out"
  print '---> '
  gets.chomp
end

def buy_stock(b, client_name)
  client = b.clients[client_name]
  puts "You have £#{client.show_money} to spend. Here are a lits of stocks"
  b.list_stock_prices
  puts "\nWhich one would you like to buy? Enter ticker"
  stock_ticker = gets.chomp.upcase
  stock = b.show_stock(stock_ticker)
  
  
  if stock
    stock_price = stock[:@lastTrade]
    puts "Great choice.  My mum is even trying to buy #{stock[:@name]} shares"
    nos_can_buy = (client.show_money / stock_price).floor
    puts "You can buy up to #{nos_can_buy} shares. How many would you like to buy?"

    nos_to_buy = gets.chomp.to_i
    
    while nos_to_buy <= 0 || nos_to_buy > nos_can_buy
      puts "You have to put in a number between 0 and #{nos_can_buy}."
      nos_to_buy = gets.chomp.to_i
    end

    print "\nCongratulations - you have bought #{nos_to_buy} #{stock[:@name]} "
    puts "shares at a price of £#{stock_price} each."
    client.buy_stock(stock_ticker,stock_price,nos_to_buy)
    puts "You now have £#{client.show_money} left in your account" 
    

  else
    puts "No such stock"
  end
end

def sell_stock(b, client_name)
  client = b.clients[client_name]
  b.list_client_portfolio(client_name)
  puts "Which stock would you like to sell? Please type in the ticker"
  stock = gets.chomp.upcase
  if client.list_portfolio[stock]
    puts "You can sell up to #{client.list_portfolio[stock].nos_shares} shares. How many would you like to sell?"
    amount_to_sell = gets.chomp.to_i 
    while amount_to_sell < 0 || amount_to_sell > client.list_portfolio[stock].nos_shares
      puts "Sorry - please put in a number between 0 and #{client.list_portfolio[stock].nos_shares} "
       amount_to_sell = gets.chomp.to_i 
    end
    current_price = b.stocks[stock][:@lastTrade]
    client.sell_stock(stock, current_price, amount_to_sell)
    if client.portfolio[stock].nos_shares == 0
      client.portfolio.delete(stock)
    end
    puts "You sold the #{amount_to_sell} shares."
    b.list_client_portfolio(client_name)

  else 
    puts "You don't own #{stock}"
  end
end


def create_client(b)
  puts "What's the new clients name?"
  client_name = gets.chomp.to_s
  puts "How much money does the client have?"
  client_money = gets.chomp.to_i
   
  new_client = Client.new(client_name, client_money)
  
  b.add_client(new_client)

  puts "Client added. Here are all the current clients."
  puts "Log in to see portfolios and money"

  b.list_clients
end

def log_on(b)
  b.list_clients

  puts "Which of these clients are you?"
  user_name = gets.chomp

  if b.clients[user_name]
    puts "\n#{user_name} you are now logged in. What would you like to do?"

    client_response = client_menu

    while client_response != "q"
      case client_response
      when "1"
        print "Updating stock data  "
        b.update_stock_data
        working
        puts "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\bStock data updated.     "
        b.list_client_portfolio(user_name)
        pause
      when "2"  
        buy_stock(b, user_name)
        b.list_client_portfolio(user_name)
      when "3"
        sell_stock(b, user_name)
      else
        puts "That's not an option"
      end
      client_response = client_menu
    end 
  
  else 
    puts "No such client"
  end

 end


def pause
   print "\nHit Enter to continue"
   gets
end

def spacer(value, col_width)
  #formats columns to fixed widths
  value = value.to_s
  space = ""
  (col_width - value.size).times { space << " "}
  value += space 
end



def working 
  (1..4).each do |i|
    print "\b\\"
    sleep(1.0/6)
    print "\b|"
    sleep(1.0/6)
    print("\b/")
    sleep(1.0/6)
    print("\b-")
    sleep(1.0/6)
  end
end







