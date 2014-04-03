def menu
  puts `clear`
  puts "*** Welcome to Building Management v.01 (beta) ***\n"
  puts "1: List Flats"
  puts "2: List Prospects"
  puts "3: Let Flat"
  puts "4: Evict Tenant"
  puts "5: List Empty Flats"
  puts "6: List Current Tenants"
  puts "7: Create a Prospect"
  #if time, consider menu items for adding new flats and/or monthly income information
  puts "Q: Quit"
  print "---->  "
  gets.chomp


end

def let_flat(building)
  print "Which flat (#{building.list_empty_flats})? "

  flat_name = gets.chomp
  print "Which prospect? "
  prospect_name = gets.chomp

  prospect = building.prospects.delete(prospect_name)
  flat = building.flats[flat_name]

  if prospect && flat && flat.vacant?
    flat.tenants[prospect.name] = prospect
    puts "#{prospect_name} has been allocated #{flat_name}."
  else
    puts "Either the flat or the prospect name is invalid."
  end

end

