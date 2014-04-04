def menu
  puts 'clear'
  puts '*** Welcome to Building Management v.01 (beta) ***'
  puts '1 : List Flats'
  puts '2 : List Prospects'
  puts '3 : Let Flat'
  puts '4 : Evict a tentant'
  puts '5 : List Empty Flats'
  puts '6 : List Current Tentants'
  puts '7 : Create Prospect'
  # puts '8 : Monthly Income'
  # puts '9 : Create Flat'
  # puts '10: Edit Flat'
  puts 'q : Quit'
  print '--->'
  gets.chomp
end

def valid_string_input(array)
  input = gets.chomp
  unless array.index(input)
    puts "Not a valid entry."
    puts "Please enter one of: '#{array.join("', '")}'"
    input = gets.chomp
  end
  input
end

def let_flat(building)
  print 'Which flat?'
  print "(#{building.list_empty_flats})
    "
  flat_name = gets.chomp
  print 'Which prospect? '
  prospect_name = gets.chomp
  prospect = building.prospects.delete(prospect_name)
  flat = building.flats[flat_name]

  if prospect && flat && flat.vacant?
    flat.tenants[prospect.name] = prospect
    puts "#{prospect_name} has moved into #{flat_name}."
  else
      puts "Either the flat or prospect name is invalid"
  end
  puts "press enter to continue."
end

def evict_tenant(building)
    tenants = [ ]
    building.flats.each { |name, flat| tenants << flat.tenants.keys }
    puts 'Who do you want to make homeless you heartless bastard?  Choose:'
    puts tenants.flatten.join(", ")
    evicted_tenant = valid_string_input(tenants.flatten)
    building.flats.each { |name, flat| flat.tenants.delete(evicted_tenant)}
    puts "#{evicted_tenant} has been evicted."
    puts "press enter to continue."
  end
