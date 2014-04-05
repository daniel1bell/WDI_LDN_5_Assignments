def menu
  puts `clear`
  puts "*** Welcome to World Takeover / Investment Trading v.01 ***"
  puts "1 : List Clients"
  puts "2 : List Portfolios (works)"
  puts "3 : Add a Portfolio to a Client"
  puts "4 : Remove a Portfolio from a Client"
  puts "5 : List Inactive Clients"
  puts "6 : List Active CLients"
  puts "7 : New Portfolio"
  puts "8 : New Client"
  puts "9 : Potential Monthly Income"
  puts "q : Quit"
  print '---> '
  gets.chomp
end


def add_portfolio(brokerage)
  print 'Which Client? '
  print "(#{brokerage.list_empty_clients}) "
  client_name = gets.chomp

  print 'Which Portfolio? '
  print "(#{brokerage.list_portfolios}) "
  portfolio_name = gets.chomp

  portfolio = brokerage.portfolio.delete(portfolio_name)
  client = brokerage.clients[client_name]

  #if portfolio && client && client.vacant?
    #client.portfolios[portfolio.name] = portfolio
    #puts "#{portfolio_name} has moved into #{client_name}"
  #else
   # errors = []
   # errors << "portfolio name is invalid" unless portfolio
   # errors << "client name is invalid" unless client
   # errors << "client is not vacant" if client && !client.vacant?

   # puts "The #{errors.join(' and the ')}."
  #end
end

def evict_portfolio(brokerage)
  print 'Which client? '
  print "(#{brokerage.list_occupied_clients}) "
  client_name = gets.chomp

  client = brokerage.clients[client_name]

  if client
    print 'Which portfolio? '
    print "(#{client.list_portfolios}) "
    portfolio_name = gets.chomp
  end

  portfolio = client.portfolios.delete(portfolio_name) if client

  if client && portfolio
    puts "portfolio #{portfolio_name} has been evicted."
  else
    errors = []
    errors << "portfolio name is invalid" if client && !portfolio
    errors << "client name is invalid" unless client

    puts "The #{errors.join(' and the ')}."    
  end
end

def create_portfolio(brokerage)
  print 'What is the portfolio name? '
  name = gets.chomp

  case 
    when name.empty?
      puts "You must enter a name."
  
    when brokerage.portfolios.keys.include?(name)
      puts "That name has already been taken by existing portfolio"
      
    else
      print 'What is their phone number? '
      phone = gets.chomp

      brokerage.portfolios[name] = Portfolio.new(name, phone)
      puts "#{name} has been created as a portfolio"
      name.add_portfolio
  end
end


def create_client(brokerage)
  print 'What is its name? '
  name = gets.chomp

  case 
    when name.empty?
      puts "You must enter a name."

    when brokerage.clients.keys.include?(name)
      puts "That name has already been taken by existing client"

    else
      print 'What is the price? '
      price = gets.chomp

      print 'How many bedrooms? '
      bedrooms = gets.chomp

      print 'How many bathrooms? '
      bathrooms = gets.chomp

      brokerage.clients[name] = client.new(name, price, bedrooms, bathrooms)
      puts "#{brokerage.clients[name] } has been created."
  end

end