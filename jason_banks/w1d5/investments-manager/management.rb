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
















end