class Management

  attr_accessor :clients, :response

  def initialize
    @clients = {}
  end

  def list_clients
    if clients.any?
      puts "\nWe have #{clients.length} clients.\n\n"
      clients.values.join("\n")
      puts "\n\n"
    else
      puts "\nWe have no clients.\nQuel bromaggedon!"
    end
  end

  

  

  def add_client
    puts "\nClient Information\n\n"
    print "Name: "
    name = gets.chomp
      while clients.keys.include?(name) || client_name.downcase == "new"
        puts "\nClient name exists or is invalid. Please provide a different name: "
        name = gets.chomp
      end
    print "Phone: "
    phone = number_get_and_confirm(gets.chomp)
    print "Opening Balance: $"
    balance = number_get_and_confirm(gets.chomp)
    new_client = Client.new(name, phone, balance)
    clients[new_client.name] = new_client
    puts "\nAdded\n\n"
    new_client.to_s
    print "\nPurchase stock for #{new_client.name} (y/n)? "
    response = gets.chomp.downcase
    while response != "y" || response != "n"
      print "\nInvalid choice.\nPurchase stock for #{new_client.name} (y/n)? "
      response = gets.chomp.downcase
    end
    if response == "y"
      create_portfolio(clients[new_client.name])
    end
  end

  def confirm_client
    print "\nEnter name of client: "
      client_name = gets.chomp
      while !clients.keys.include?(client_name) || client_name != "new"
        print "\nInvalid entry.\nEnter name of client or enter \"new\" to create a new client: "
        client_name = gets.chomp
      end
      if client_name == "new"
        add_client
      else
        client = clients[client_name]
      end
  end

  def create_portfolio(client=nil)
    if !client
      client = confirm_client_name
    else
      client = client
    end

    print "\nEnter name of portfolio: "
    portfolio_type = gets.chomp.downcase.capitalize.to_sym
    portfolio = client.portfolios[portfolio_type]

    if portfolio?
      portfolio_response = "\n#{client.key} already has a #{portfolio_type} portfolio."
      if portfolio.any?
        portfolio_response << "\n\n#{portfolio_type} portfolio: #{portfolio.stocks.keys.join(", ")}."
      end
      portfolio_response
    else
      client.portfolios[portfolio_type] = Portfolio.new(portfolio_type)
    end
    buy_stock(client)
  end
  
  def confirm_portfolio(client)
    print "\nChoose portfolio (#{client.portfolios.keys.join(", ")}): "
    portfolio_type = gets.chomp.downcase.capitalize.to_sym
    while !client.portfolios.keys.include?(portfolio_type)
      print "\nInvalid choice.\nChoose a portfolio or enter \"new\" to create a portfolio: "
      portfolio_type = gets.chomp.downcase.capitalize.to_sym
    end

    if portfolio_type == :New
      create_portfolio
    else
      portfolio = client.portfolios[portfolio_type]
    end
  end

  def confirm_stock_symbol(portfolio)
    print "\nEnter stock symbol: "
    stock_symbol = gets.chomp.upcase
    stock_symbol_original = stock_symbol
    while portfolio.keys.include?(stock_symbol)
      puts "\n#{client_name}'s #{portfolio_type} portfolio already includes #{stock.units} units of #{stock_symbol}."
      puts "#{client_name}'s investment in #{stock.name} is $#{sprintf("%.2f", stock.get_current_investment)}."
      puts "\nIf you entered #{stock_symbol} in error, please enter the correct stock symbol, otherwise enter \"more\" to purchase additional units of #{stock_symbol}: "
      stock_symbol = gets.chomp.upcase
    end

    if stock_symbol == "MORE"
      portfolio[stock_symbol_original].buy_more_units
    else
      print "\nEnter number of units of #{stock_symbol} to purchase: "
      units = gets.chomp
      while !is_a_number(units) || units.include?(".") || number_get_and_confirm(units) < 0
        print "\nInvalid entry. Units should be a positive whole number: "
        units = gets.chomp
      end
      units = number_get_and_confirm(units)
      if client.balance_check(stock_symbol, units)
        portfolio[stock_symbol] = Stock.new(stock_symbol, units)
      else
        puts "\n#{client_name}'s account cannot afford to make this investment at this time."
      end
    end

      
    end
  end



  def buy_stock(client=nil)

    if !client
      client = confirm_client
    end

    print "\nUse an existing portfolio (y/n)? "
    response = gets.chomp.downcase
    while response != "y" || response != "n"
      print "\nInvalid choice.\nUse an existing portfolio (y/n)? "
      response = gets.chomp.downcase
    end
    if response == "n"
      create_portfolio(client)
    else
      portfolio = confirm_portfolio(client)
    end
      
    stock = confirm_stock_symbol(portfolio)

    if portfolio.keys.include?(stock_symbol)
      stock = portfolio[stock_symbol]
      
    elsif portfolio && !portfolio.keys.include?(stock_symbol)
      portfolio.add_new_stock
      

      

      client.portfolios.keys.include?(portfolio) && client.portfolios[portfolio].keys.include?(stock_symbol)
      print "\n#{portfolio} already includes #{}"
    print "\nEnter number of units to purchase (whole numbers): "
    units = gets.chomp
    
    units = number_get_and_confirm(units)
  end
      
        


















end