def menu
  puts `clear`
  puts "*** Welcome to Your Fancy Stock App v.01  (beta) ***"
  puts "1 : Create an account for a client."
  puts "2 : Create a new portfolio."
  puts "3 : Buy stocks for a client."
  puts "4 : Sell stocks for a client."
  puts "5 : List all client information - portfolios and account balance."
  puts "6 : List all stocks in a client's portfolio."
  puts "7 : List all clients."
  puts "q : Quit"
  print '---> '
  gets.chomp
end

def add_client(firm)
print "What is the new client's name?\n"
  name = gets.chomp

  case 
    when name.empty?
      puts "You must enter a name."
  
    when firm.clients.keys.include?(name)
      puts "That name is taken."
      
    when firm.clients.keys.include?(name)
      puts "That name is taken."

    else
      print "What is their current balance?\n$"
      balance = gets.chomp

      firm.clients[name] = Client.new(name, balance)
      puts "Your new client is #{name} with a balance of $#{balance}"
  end
end

def add_portfolio(firm)
 print 'For which client? '
  print "[#{firm.clients.keys.join(", ")}]\n"
  client_name = gets.chomp
  client = firm.clients[client_name]

  print "What is the new portfolio's name?\n"
  portfolio_name = gets.chomp
  
  case 
    when portfolio_name.empty?
      puts "You must enter a name."
  
    when client.portfolio.keys.include?(portfolio_name)
      puts "That name has already been used."
    
    else
      client.portfolio[portfolio_name] = Portfolio.new(portfolio_name)
      puts "#{portfolio_name} has been added as one of #{client}'s portfolios."
    end
  end
