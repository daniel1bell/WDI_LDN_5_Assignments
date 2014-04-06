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

  def is_a_number(s)
    s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end

  def number_get_and_confirm(x)
    while !is_a_number(x)
      if x.include?(".")
        print "Please only enter digits: $"
      else
        print "Please only enter digits: "
      end
      x = gets.chomp
    end
    if x.include?(".")
      x.to_f
    else
      x.to_i
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
      end
      client = clients[client_name]
  end

  def confirm_portfolio
    print "\nChoose portfolio (#{client.portfolios.keys.join(", ")}): "
    portfolio_type = gets.chomp.downcase.capitalize.to_sym
    while !client.portfolios.keys.include?(portfolio_type)
      print "\nInvalid choice.\nChoose a portfolio or enter \"new\" to create a portfolio: "
      portfolio_type = gets.chomp.downcase.capitalize.to_sym
    end

    if portfolio_type == :New
      create_portfolio
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
        portfolio_response << "It contains units of #{portfolio.stocks.keys.join(", ")}."
      end
      portfolio_response
    else
      client.portfolios[portfolio_type] = Portfolio.new(portfolio_type)
      portfolio
    end

    buy_stock(client)
  end
  

  def buy_stock(client=nil)

    if !client
      client_name = confirm_client
    else
      print "\nUse an existing portfolio (y/n)? "
      response = gets.chomp.downcase
      while response != "y" || response != "n"
        print "\nInvalid choice.\nse an existing portfolio (y/n)? "
        response = gets.chomp.downcase
      end
      if response == "n"
        create_portfolio
      else
        confirm_portfolio
      
      



        portfolio = client.portfolios[portfolio_type]
        print "\nEnter stock symbol: "
        stock_symbol = gets.chomp.upcase
      




      
          
    

      

      if portfolio? && portfolio.keys.include?(stock_symbol)
        stock = portfolio[stock_symbol]
        puts "\n#{client_name}'s #{portfolio_type} portfolio already includes #{stock.units} units of #{stock_symbol}."
        puts "\n#{client_name}'s investment in #{stock.name} is $#{sprintf("%.2f", stock.get_current_investment)}."
      elsif portfolio && !portfolio.keys.include?(stock_symbol)
        portfolio.add_new_stock
        

        

        client.portfolios.keys.include?(portfolio) && client.portfolios[portfolio].keys.include?(stock_symbol)
        print "\n#{portfolio} already includes #{}"
      print "\nEnter number of units to purchase (whole numbers): "
      units = gets.chomp
      while !is_a_number(units) || units.include?(".") || number_get_and_confirm(units) < 0
        print "\nInvalid entry. Units should be a positive whole number: "
        units = gets.chomp
      end
      units = number_get_and_confirm(units)
      
        


















end