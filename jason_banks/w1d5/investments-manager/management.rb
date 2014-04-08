class Management

  attr_accessor :clients, :response

  def initialize
    @clients = {}
  end

  def list_clients
    if clients.any?
      puts "\nWe have #{clients.length} clients.\n\n"
      clients.values.join("\n\n")
      puts "\n\n"
    else
      puts "\nWe have no clients.\nQuel bromaggedon!"
    end
  end

  def add_client
    puts "\nClient Information\n\n"
    print "Name: "
    name = gets.chomp
      while clients.keys.include?(name) || name.downcase == "new"
        puts "\nClient name exists or is invalid. Please provide a different name: "
        name = gets.chomp
      end
    print "Phone: "
    phone = number_get_and_confirm(gets.chomp)
    print "Opening balance: $"
    balance = number_get_and_confirm(gets.chomp)
    while balance < 0
      puts "\nOpening balance cannot be negative."
      print "Enter opening balance: $"
      balance = number_get_and_confirm(gets.chomp)
    end
    new_client = Client.new(name, phone, balance)
    clients[new_client.name] = new_client
    puts "\nAdded\n\n"
    new_client.to_s
    print "\nPurchase stock for #{new_client.name} (y/n)? "
    response = gets.chomp.downcase
    while response != "y" && response != "n"
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
      while !clients.keys.include?(client_name) && client_name != "new"
        binding.pry
        print "\nInvalid entry.\nEnter name of client or enter \"new\" to create a new client: "
        client_name = gets.chomp
      end
      if client_name == "new"
        add_client
      else
        clients[client_name]
      end
  end

  def create_portfolio(client=nil)
    if !client
      client = confirm_client_name
    else
      client = client
    end

    print "\nName portfolio: "
    portfolio_type = gets.chomp.downcase.capitalize.to_sym
    portfolio = client.portfolios[portfolio_type]

    if portfolio
      portfolio_response = "\n#{client.key} already has a #{portfolio_type} portfolio."
      if portfolio.stocks.any?
        portfolio_response << "\n\n#{portfolio_type} portfolio: #{portfolio.stocks.keys.join(", ")}."
      end
      portfolio_response
    else
      new_portfolio = Portfolio.new(portfolio_type)
      client.portfolios[portfolio_type] = new_portfolio
    end
    buy_stock(client, new_portfolio)
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
      client.portfolios[portfolio_type]
    end
  end

  def confirm_stock_symbol(portfolio)
    print "\nEnter stock symbol: "
    stock_symbol = gets.chomp.upcase
    stock_symbol_original = stock_symbol
    while portfolio.stocks.keys.include?(stock_symbol)
      stock = portfolio.stocks[stock_symbol]
      puts "\n#{portfolio.type} portfolio already includes #{stock.units} units of #{stock_symbol}."
      puts "The investment in #{stock.stock_name} is $#{sprintf("%.2f", stock.get_current_investment)}."
      puts "\nIf you entered #{stock_symbol} in error, please enter the correct stock symbol, otherwise enter \"more\" to purchase additional units of #{stock_symbol}: "
      stock_symbol = gets.chomp.upcase
      if portfolio.stocks.keys.include?(stock_symbol)
        stock_symbol_original = stock_symbol
      end
    end
    if stock_symbol == "MORE"
      stock_symbol_original
    else
      stock = YahooFinance::get_standard_quotes(stock_symbol)[stock_symbol]
      while stock == nil && stock.lastTrade > 0
        puts "\nYou have entered an invalid stock symbol or #{stock_symbol} is worthless."
        print "\nRe-enter the stock symbol: "
        stock_symbol = gets.chomp.upcase
      end
      stock_symbol
    end
  end


  def buy_stock(client=nil, portfolio=nil)

    if !client
      client = confirm_client
    end

    if client.portfolios.empty?
      create_portfolio(client)
    elsif portfolio
      stock_symbol = confirm_stock_symbol(portfolio)
    else
      print "\nUse an existing portfolio (y/n)? "
      response = gets.chomp.downcase
      while response != "y" && response != "n"
        print "\nInvalid choice.\nUse an existing portfolio (y/n)? "
        response = gets.chomp.downcase
      end
      if response == "y"
        portfolio = confirm_portfolio(client)
        stock_symbol = confirm_stock_symbol(portfolio)
      else
        create_portfolio(client)
      end
    end
    

    if portfolio.stocks.keys.include?(stock_symbol)
      stock = portfolio.stocks[stock_symbol]
      puts "\nCurrent units: #{stock.units}"
      puts "Current investment: #{stock.get_current_investment}"
      print "Additional units to purchase: "
      additional_units = confirm_units(gets.chomp)

      if client.balance_check(stock_symbol, additional_units)
        stock.buy_more_units(additional_units)
      else
        puts "\n#{client.name}'s account cannot afford to make this investment at this time.\n"
      end
      puts client.to_s
    else
      print "\nEnter number of units of #{stock_symbol} to purchase: "
      units = confirm_units(gets.chomp)

      if client.balance_check(stock_symbol, units)
        portfolio.stocks[stock_symbol] = Stock.new(stock_symbol, units)
        puts "\n#{units} of #{stock_symbol} have been purchased for #{client.name}."
      else
        puts "\n#{client.name}'s account cannot afford to make this investment at this time."
      end
      return
    end
  end

  def sell_stock
    client = confirm_client
    if client.portfolios.empty?
      puts "\n#{client.name} has no investments.\n"
      return
    else
      portfolio = confirm_portfolio(client)
    end

    print "\nEnter stock symbol (#{portfolio.stocks.keys.join(", ")}): "
    stock_symbol = gets.chomp.upcase
    while !portfolio.stocks.keys.include?(stock_symbol)
      puts "\nInvalid choice."
      print "Please enter stock symbol: "
      stock_symbol = gets.chomp.upcase
    end
    stock = portfolio.stocks[stock_symbol]
    puts "\nCurrent units of #{stock_symbol}: #{stock.units}"
    print "Number of units to sell: "
    units_to_sell = confirm_units(gets.chomp)
    if units_to_sell > stock.units
      puts "\nThis amount exceeds the number of units available."
      return
    else
      stock.calc_stock_sale(units_to_sell)
      if stock.units == 0 && stock.start_investment == 0
        binding.pry
        client.portfolios.delete(portfolio)
      end
      puts client.to_s
      return
    end
    
  end
      





end