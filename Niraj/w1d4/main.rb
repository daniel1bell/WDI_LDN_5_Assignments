require 'pry'

#load files
require_relative 'person'
require_relative 'flat'
require_relative 'building'
require_relative 'menu'

#enter initial files
b = Building.new('w1n_4hr')
b.affluency = :minted

f1 = Flat.new('Reeves', 750, 4, 2)
f2 = Flat.new('9 Black Hill', 5000, 21, 4)
f3 = Flat.new('The Bowler', 1000, 5, 2)

p1 = Person.new('Louie', '911')
p2 = Person.new('Scotty', '999')
p3 = Person.new('Dan', '111')
p4 = Person.new('Julien', '687')
p5 = Person.new('John', '402')




[f1,f2,f3].each do |flat|
  b.flats[flat.name] = flat
end



f1.tenants[p1.name] = p1
f2.tenants[p2.name] = p2
f2.tenants[p3.name] = p3

b.prospects[p4.name] = p4
b.prospects[p5.name] = p5


response = menu.downcase
while response != "q"

      case response
      when '1'
        puts b.list_flats 
      when '2'
        puts b.list_prospects # TO DO
      when '3'
        let_flat(b)
      when '4'
        b.evict_tenant 
      when '5'
        puts b.list_empty_flats 
      when '6'
        b.list_tenants 
      when '7'
        puts b.create_prospect 
      when '8'
        puts b.create_flat
      else
        puts "Invalid, please try again"
      end
    gets

  response = menu
end
 