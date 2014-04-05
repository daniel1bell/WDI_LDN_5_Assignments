def menu
  puts `clear`
  puts "*** Mike's Brokerage House ***"
  puts "\n\n"
  print "Curently "
  print !$data_setting ? "not " : ""
  puts "using internet data"  
  puts "To change goto settings"

  puts "\n\n"

  puts "1 : List Stocks on the Brokerage"
  puts "2 : Update stock prices"
  puts "3 : List Clients"
  puts "4 : Add a CLient"
  puts "5 : See a Clients Portfolio"
  puts "6 : Log on as a Client to trade"
  puts "s : Settings"
  puts "q : Quit"

  print '---> '
  gets.chomp

end


def settings
#sets whether using internet data or not.

  if $data_setting 
    puts "Currently using data from the internet"
  else
    puts "Currently using local data"
  end

  puts "Would you like to change the settings?"
  puts "(y)es/(n)o"
  change = gets.chomp.downcase

  if change =="y"
    puts "Changing the setting"
    $data_setting = $data_setting ? false : true
  else
    puts "Not changing"
  end
  
  puts $data_setting ? "Using internet data" : "Using local data"


end


def spacer(value, col_width)
  value = value.to_s
  space = ""
  (col_width - value.size).times { space << " "}
  value += space 
end


def buy_stock(b, client_name)
  client = b.clients[client_name]
  puts "You have £#{client.show_money} to spend. Here are a lits of stocks"
  b.list_stock_prices
  puts "\nWhich one would you like to buy? Enter ticker"
  stock_ticker = gets.chomp.upcase
  stock = b.show_stock(stock_ticker)
  stock_price = stock[:@lastTrade]
  
  if stock
    puts "Great choice.  My mum is even trying to buy those."
    nos_can_buy = (client.show_money / stock_price).floor
    puts "You can buy up to #{nos_can_buy}. How many would you like to buy?"

    nos_to_buy = gets.chomp.to_i
    
    while nos_to_buy <= 0 || nos_to_buy > nos_can_buy
      puts "You have to put in a number between 0 and #{nos_can_buy}"
      nos_to_buy = gets.chomp.to_i
    end

    puts "Congratualtioin - you have bought #{nos_to_buy} at a price of £#{stock_price} each"
    client.buy_stock(stock_ticker,stock_price,nos_to_buy)
    puts "You now have £#{client.show_money} left in your account" 
    puts "Here is your current portfolio"

  else
    puts "No such stock"
  end


end



def create_client(b)
  puts "What's the clients name?"
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
    puts "#{user_name} you are now logged in. What would you like to do?"

    client_response = client_menu

    while client_response != "q"
      case client_response
      when "1"
        b.list_client_portfolio(user_name)
      when "2"  
        buy_stock(b, user_name)
      when "3"
        #sell a stock
      else
        puts "That's not an option"
      end

      # print "\nHit Enter to continue"
      # gets  
      client_response = client_menu
    end 
    

  else 
    puts "No such client"
  end

 end


 def client_menu
  puts "1 : Show and value portfoliio"
  puts "2 : Buy a stock"
  puts "3 : Sell a stock"
  puts "q : Quit - log out"
  print '---> '
  gets.chomp
end


  







