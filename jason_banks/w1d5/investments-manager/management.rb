class Management

  attr_accessor :clients

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
      while clients.keys.include?(name)
        puts "\nClient name already exists. Please provide a name other or more specific than #{name}: "
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
  end

  def buy_stock
    if clients.any?
      print "\nEnter client name: "
      client_name = gets.chomp
      while !clients.keys.include?(client_name)
        puts "\nInvalid entry.\nEnter client name: "
        client_name = gets.chomp
      end
      print "\nEnter stock symbol: "
      stock_symbol = gets.chomp.upcase
      print "\nEnter number of units (whole numbers): "
      units = gets.chomp
      while is_a_number(units) && units.include?(".")
        print "\nEnter number of units in whole numbers: "
        units = gets.chomp
      if clients[client_name].portfolios.empty?
        print "\nEnter name of new portfolio: "
        portfolio = gets.chomp.capitalize.to_sym
      else
        print "\nChoose portfolio (#{clients[client_name].portfolios.keys.join(", ")}) or name a new portfolio: "
        portfolio = gets.chomp.capitalize.to_sym
      end

        


















end