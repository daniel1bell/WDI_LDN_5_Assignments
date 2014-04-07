def menu
  puts `clear`
  puts "********** Welcome to your Brokerage Management System ********\n"
  puts
  puts
  puts "1\t:\tView Client Details"
  puts "2\t:\tCheck a Stock Value"
  puts "3\t:\tAdd a Client"
  puts "4\t:\tAdd a Portfolio"
  puts "5\t:\tBuy Stock for a Client"
  puts "6\t:\tSell Stock for a Client"
  puts "q\t:\tQuit"
  puts 
  print "---> \t"
  gets.chomp.downcase
end

def view_client(brokerage)
  brokerage.list_clients
  puts "Which client would you like to see details for?"
  client_name = gets.chomp
  if brokerage.clients.has_key?("#{client_name}")
    puts
    puts "#{client_name} has the following portfolios:\n"
    brokerage.clients.fetch("#{client_name}").portfolios.each {|names, values| puts values}
  else
    puts "The client name was invalid. Please try again."
  end
end

def add_client(brokerage)
  print "What is the client name? "
  client_name = gets.chomp.capitalize
  unless brokerage.clients.has_key?("#{client_name}")
    print "How much cash does the client have for SuperStock to manage? $"
    client_cash = gets.chomp.to_f
    print "Client: enter your super secure pasword here. "
    client_pass = gets.chomp

    brokerage.clients[client_name] = Client.new(client_name, client_cash, client_pass)
    puts "\nThanks for adding #{client_name} as a new client. Please proceed to add a new portfolio for them."
  else
    puts "You cannot add a new client with the same name as a current client. Please use option 1 to view current clients and try again."
  end
end

def add_portfolio(brokerage)
  brokerage.list_clients
  puts "Which client's portfolio would you like to buy stock for?"
  client_name = gets.chomp.capitalize
  if brokerage.clients.has_key?("#{client_name}")
    puts
    unless brokerage.clients.fetch(client_name).portfolios.empty?
      puts "#{client_name} currently has the following portfolios:"
      brokerage.clients.fetch("#{client_name}").portfolios.each do |key, value|
        puts key
      end
      puts
    end
    
    puts "What would you like to call the new portfolio?"
    portfolio_name = gets.chomp.capitalize

    unless brokerage.clients.fetch("#{client_name}").portfolios.has_key?("#{portfolio_name}")
      brokerage.clients.fetch("#{client_name}").portfolios[portfolio_name] = Portfolio.new(portfolio_name)
      puts "Thanks for adding #{portfolio_name} to the client, #{client_name}. Please proceed to instruct the client to buy stocks for the portfolio."
      else
      puts "You cannot add a new portfolio with the same name as an old portfolio. Please try again."
    end
    else
    puts "The client name was invalid. Please try again."
  end
end

def stockcheck
  puts "What is the NASDAQ code for the stock you wish to check the value of?"
  code = gets.chomp.upcase
  code_name = YahooFinance::get_standard_quotes(code)[code].name
  code_trade = YahooFinance::get_standard_quotes(code)[code].lastTrade
  
  puts
  puts "Stock Code:\t\t#{code}"
  puts "Company Name:\t\t#{code_name}"
  puts "Last Trade Value:\t#{code_trade}"
end

def buy_stock(brokerage)
  brokerage.list_clients
  puts "Which client would you like to add a portfolio for?"
  client_name = gets.chomp.capitalize

  if brokerage.clients.has_key?("#{client_name}")
    brokerage.clients.fetch(client_name).check_password(brokerage.clients.fetch(client_name))
    brokerage.list_client(client_name)
    puts "\nWhich portfolio would you like to buy stock for?"
    portfolio_name = gets.chomp.capitalize

    if brokerage.clients.fetch(client_name).portfolios.has_key?("#{portfolio_name}")
      puts "\nWhich stock would you like to buy? (Enter a valid NASDAQ stock code) ->"
      code = gets.chomp.upcase
      code_name = YahooFinance::get_standard_quotes(code)[code].name
      code_trade = YahooFinance::get_standard_quotes(code)[code].lastTrade
      client_cash = brokerage.clients.fetch(client_name).cash
      available_stock = (client_cash/code_trade).floor

      puts "\n\nStock Code:\t\t#{code}"
      puts "Company Name:\t\t#{code_name}"
      puts "Last Trade Value:\t#{code_trade}"
      puts
      puts "You have $#{client_cash.round(2)} available and can buy up to #{available_stock} shares of #{code} stock at its current value.\n"
      puts "How much #{code} stock would you like to buy?"
      purchase_quantity = gets.chomp.to_f.floor.to_i
      purchase_value = purchase_quantity * code_trade
      new_client_cash = client_cash - purchase_value

      if purchase_quantity <= available_stock
        brokerage.clients.fetch(client_name).cash = new_client_cash
        brokerage.clients.fetch(client_name).portfolios.fetch(portfolio_name).stocks[code] = Stock.new(code, purchase_quantity, code_name, code_trade)

        puts "\nCongratulations! You've just bought #{purchase_quantity} shares of #{code}.\nWe have deducted $#{purchase_value.round(2)} from your account."
        brokerage.list_client(client_name)
      else
        puts "I'm sorry, you can't buy that much stock. Please try again."
      end
    else
      puts "The portfolio name was invalid. Please try again."
    end
  else
    puts "The client name was invalid. Please try again."
  end
end

def sell_stock(brokerage)
  brokerage.list_clients
  puts "Which client's portfolio would you like to sell stock for?"
  client_name = gets.chomp.capitalize

  if brokerage.clients.has_key?("#{client_name}")
    brokerage.clients.fetch(client_name).check_password(brokerage.clients.fetch(client_name))
    brokerage.list_client(client_name)
    puts "\nWhich portfolio would you like to sell stock for?"
    portfolio_name = gets.chomp.capitalize

    if brokerage.clients.fetch(client_name).portfolios.has_key?("#{portfolio_name}")
      puts "\nWhich stock would you like to sell? (Enter a valid NASDAQ stock code) ->"
      code = gets.chomp.upcase
      if brokerage.clients.fetch(client_name).portfolios.fetch(portfolio_name).stocks.has_key?("#{code}")
        code_name = YahooFinance::get_standard_quotes(code)[code].name
        code_trade = YahooFinance::get_standard_quotes(code)[code].lastTrade
        client_cash = brokerage.clients.fetch(client_name).cash
        available_stock = (client_cash/code_trade).floor
        bought_value = brokerage.clients.fetch(client_name).portfolios.fetch(portfolio_name).stocks.fetch(code).stock_price
        bought_amount = brokerage.clients.fetch(client_name).portfolios.fetch(portfolio_name).stocks.fetch(code).number_stocks
        sell_value = bought_amount * code_trade
        new_client_cash = client_cash + sell_value
        sell_profit = (bought_amount * code_trade) - (bought_amount * bought_value)

        if bought_value < code_trade
          profit_loss = "profit"
        else
          profit_loss = "loss"
        end

        puts "Current Stock Prices:"
        puts "\n\nStock Code:\t\t#{code}"
        puts "Company Name:\t\t#{code_name}"
        puts "Last Trade Value:\t#{code_trade}"
        puts
        puts "You bought your shares in #{code} at a price of $#{bought_value}. You currently have #{bought_amount} #{code} shares in this portfolio."
        puts
        puts "If you sold today you would receive a #{profit_loss} of $#{sell_profit.round(2)}.\n$#{sell_value.round(2)} would be deposited in your client cash account making the new balance $#{new_client_cash.round(2)}.\n\nDO YOU WANT TO SELL YOUR STOCK in #{code} from your portfolio: #{portfolio_name}? (y/n)"
        sell_response = gets.chomp.downcase

        if sell_response == "y"
          brokerage.clients.fetch(client_name).cash = new_client_cash
          brokerage.clients.fetch(client_name).portfolios.fetch(portfolio_name).stocks.delete(code)

          puts "\nYou've just sold #{bought_amount} shares of #{code}.\nYour #{profit_loss} of $#{sell_profit.round(2)} and sell value of #{sell_value.round(2)} has been updated in your client cash account.\nYour new client balance is $#{new_client_cash.round(2)}"
          brokerage.list_client(client_name)
        else
          puts "Returning you to the main menu."
        end
      else
          puts "\nYou can't sell stock that you don't have. Please try again."
      end
    else
      puts "The portfolio name was invalid. Please try again."
    end
  else
    puts "The client name was invalid. Please try again."
  end
end
