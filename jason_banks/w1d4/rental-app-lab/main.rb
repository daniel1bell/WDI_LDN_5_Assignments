require "pry"

# load files
require_relative "person"
require_relative "building"
require_relative "flat"
require_relative "menu"

# setup initial data
b = Building.new("w1n 4hr")
b.post_code = "w1n 4hr"
b.affluency = :minted

f1 = Flat.new("Reeves", 750, 4, 2)

f2 = Flat.new("9 Back Hill", 5000, 12, 4)

f3 = Flat.new("The Bowler", 1000, 5, 2)

[f1, f2, f3].each do |flat|
  b.flats[flat.name] = flat
end

p1 = Person.new("Louie", 911)
p2 = Person.new("Mike", 999)
p3 = Person.new("Sarah", 111)
p4 = Person.new("Julien", 333)

f1.tenants[p1.name] = p1
f1.tenants[p2.name] = p2
f2.tenants[p3.name] = p3

b.prospects[p4.name] = p4

# run command line interaction

response = menu.downcase

while response != "q"

  case response
  when "1"
    puts b.list_flats
  when "2"
    b.add_flat
  when "3"
    puts list_occupied_flats(b)
  when "4"
    b.list_tenants
  when "5"
    let_flat(b)
  when "6"
    puts b.list_empty_flats
  when "7"
    puts b.list_prospects
  when "8"
    b.create_prospect
  when "9"
    evict_tenant(b)
  else
    puts "Invalid menu choice."
  end

  puts "\nPress enter to return to the menu.\n"
  gets
  response = menu
end

puts "\n\nThank you for using Building Management v.01 (beta).\n\n"

  