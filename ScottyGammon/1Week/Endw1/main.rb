require 'pry'

# load files
require_relative 'portfolio'
require_relative 'client'
require_relative 'brokerage'
require_relative 'menu'
require_relative 'stock'

# setup initial data
b = Brokerage.new

f1 = Client.new('Michael', 75000)

f2 = Client.new('Alex', 5000)

f3 = Client.new('Imran', 1000)

[f1,f2,f3].each do |client|
  b.clients[client.name] = client
end

p1 = Portfolio.new('Growth Tech')
p2 = Portfolio.new('Emerging Markets')
p3 = Portfolio.new('Blue Chips')

f1.portfolios[p1.name] = p1
f1.portfolios[p2.name] = p2
f2.portfolios[p3.name] = p3

b.portfolios['Julien'] = Portfolio.new('Julien')

# binding.pry


# run command line interaction

response = menu.downcase
while response != "q"

  case response
    when '1'
      puts b.list_clients 

    when '2'
      puts b.list_portfolios

    when '3'
      let_client(b)

    when '4'    
      evict_portfolio(b)

    when '5'    
      puts b.list_vacant_clients

    when '6'    
      puts b.list_portfolios

    when '7'    
      create_portfolio(b)

    when '8'
      create_client(b)

    when '9'
      puts b.potential_monthly_income

    else
      puts "invalid menu choice."
  end
  puts "\npress enter to continue."
  gets

  response = menu

end

# binding.pry
