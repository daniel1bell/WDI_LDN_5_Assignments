require 'pry'
# load files
require_relative 'person'
require_relative 'flat'
require_relative 'building'
require_relative 'menu'

# enter initial data
b = Building.new("w1n 4hr")
b.affluency = :minted

f1 = Flat.new('Reeves', 750, 4, 2)
f2 = Flat.new('9 Back Hill', 5000, 14, 2)
f3 = Flat.new('The Bowler', 1000, 5, 2)
f4 = Flat.new('17 Farriers', 900, 2, 1)

p1 = Person.new('Dan', "07515 876888")
p2 = Person.new('Niraj', "07139 982198")
p3 = Person.new('Michael', "07183 183912")
p4 = Person.new('Paul', "07138 197434")
p5 = Person.new('Bobby', "07238 184491")
p6 = Person.new('Julien', "07256 871371")

flats = [f1, f2, f3, f4]

flats.each do |flat|
  b.flats[flat.name] = flat
end

f1.tenants[p1.name] = p1
f2.tenants[p4.name] = p4
f1.tenants[p2.name] = p2
f2.tenants[p5.name] = p5
f3.tenants[p3.name] = p3

b.prospects[p6.name] = p6


  def add_prospect(building)
    puts "What is the prospect's name?"
    prospect_name = gets.chomp.capitalize
    puts "What is the prospect's phone number?"
    prospect_phone = gets.chomp
    new_prospect = Person.new("#{prospect_name}", "#{prospect_phone}")
    building.prospects[new_prospect.name] = new_prospect
    puts
    puts "You have added #{prospect_name} as a new prospect."
    puts
  end

# binding.pry
# run command line interaction

response = menu.downcase
while response != "q"
 
  case response
  when "1"
    puts
    puts b.list_flats
    puts
  when "2"
    puts
    puts b.list_prospects
    puts
  when "3"
    let_flat(b)
  when "4"
    evict_tenant(b) #TODO: write this method
  when "5"
    puts b.list_empty_flats
  when "6"
    puts b.list_tenants
  when "7"
    add_prospect(b)
  else
    puts "Invalid menu choice. Press Enter and try again."
  end
puts "Press enter to continue."
gets
  response=menu
end












# binding.pry