require 'pry'

# load files
require_relative 'firm'
require_relative 'client'
require_relative 'portfolio'
require_relative 'stock'
require_relative 'menu'


# setup initial data
b = Firm.new('B Firm')

c1 = Client.new('Josh Hutcherson', 10000)

c2 = Client.new('Emma Watson', 800)

c3 = Client.new('Jennifer Aniston', 5800)

[c1,c2,c3].each do |client|
  b.clients[client.name] = client
end

p1 = Portfolio.new('Invesestments')
p2 = Portfolio.new('Investments')
p3 = Portfolio.new('Investments')
p4 = Portfolio.new('Retirement')
c1.portfolio[p1.name] = p1
c2.portfolio[p2.name] = p2
c3.portfolio[p3.name] = p3
c3.portfolio[p4.name] = p4

b.prospects['Julien'] = Person.new('Julien', '333')


response = menu.downcase
while response != "q"

  case response
    when '1'
     # puts b.list_flats 

    when '2'
      # puts b.list_prospects

    when '3'
      # let_flat(b)

    when '4'    
     # evict_tenant(b)

    when '5'    
     # puts b.list_vacant_flats

    when '6'    
     # puts b.list_tenants

    when '7'    
      # create_prospect(b)


    else
      puts "invalid menu choice."
  end
  puts "\npress enter to continue."
  gets

  response = menu

end