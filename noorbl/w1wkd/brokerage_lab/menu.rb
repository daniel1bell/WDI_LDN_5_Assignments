def menu
  puts `clear`
  puts "*** Finance Plus Brokerage ***\n\n"
  puts '1 : List Clients'
  puts '2 : List Portfolios'
  puts '3 : List Stocks'
  puts '4 : Create Client'
  puts '5 : Create Portfolio'
  puts '6 : Buy Stock for a Portfolio'
  puts '7 : Sell Stock of a Portfolio'
  puts "Q : Quit\n\n"
  print '--->'
  gets.chomp
end

def create_portfolio(brokerage)
  print "Portfolio name: "
  name = gets.chomp
  print "Date: "
  date = gets.chomp
  brokerage.portfolios[name] = Porfolio.new(name, date)
end

def create_client(brokerage)
  print "Client name: "
  name = gets.chomp
  print "Age: "
  age = gets.to_i
  portfolio.clients[name] = Person.new(name, age)
end

def assign_stock(brokerage)
  puts brokerage.display_portfolios
  print "To which portfolio do you want to assign this stock?"
  portfolio = gets.chomp

  brokerage.assign(portfolio, stock)
end

def dismiss_stock(brokerage)
  puts brokerage.display_portfolios
  print "Which stock do you want to rid from this portfolio?"
  stock = gets.chomp

  brokerage.dismiss(portfolio, stock)
end