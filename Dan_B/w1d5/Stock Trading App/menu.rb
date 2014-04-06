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

    brokerage.clients[client_name] = Client.new(client_name, client_cash)
    puts "\nThanks for adding #{client_name} as a new client. Please proceed to add a new portfolio for them."
  else
    puts "You cannot add a new client with the same name as a current client. Please use option 1 to view current clients and try again."
  end
end

def add_portfolio(brokerage)
  brokerage.list_clients
  puts "Which client would you like to add a portfolio for?"
  client_name = gets.chomp.capitalize
  if brokerage.clients.has_key?("#{client_name}")
    puts
    puts "#{client_name} currently has the following portfolios:"
    brokerage.clients.fetch("#{client_name}").portfolios.each do |key, value|
        puts key
      end
    puts
    puts "What would you like to call the portfolio?"
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
    brokerage.list_client("#{client_name}")
    puts "\nWhich portfolio would you like to buy stock for?"
    portfolio_name = gets.chomp.capitalize
    if brokerage.clients.fetch("#{client_name}").portfolios.has_key?("#{portfolio_name}")
      print "Which stock would you like to buy? (Enter a valid NASDAQ stock code) ->"
      code = gets.chomp.upcase
      code_name = YahooFinance::get_standard_quotes(code)[code].name
      code_trade = YahooFinance::get_standard_quotes(code)[code].lastTrade
      client_cash = brokerage.clients.fetch("#{client_name}").values_at(cash)

      puts "\n\nStock Code:\t\t#{code}"
      puts "Company Name:\t\t#{code_name}"
      puts "Last Trade Value:\t#{code_trade}"
binding.pry

    else
      puts "The portfolio name was invalid. Please try again."
    end
  else
    puts "The client name was invalid. Please try again."
  end


end
