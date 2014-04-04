def menu
  puts `clear`
  puts "*** Welcome to Building Management v.01 (beta) ***\n\n"
  puts "1: List Flats"
  puts "2: Add a Flat"
  puts "3: List Occupied Flats"
  puts "4: List Tenants"
  puts "5: Let a Flat"
  puts "6: List Empty Flats"
  puts "7: List Prospects"
  puts "8: Create a Prospect"
  puts "9: Evict Tenant"
  
  puts "Q: Quit"
  print "\n---->  "
  gets.chomp


end

def let_flat(building)
  print "\nWhich flat (#{building.list_empty_flats})? "

  flat_name = gets.chomp
  print "Which prospect? "
  prospect_name = gets.chomp

  prospect = building.prospects.delete(prospect_name)
  flat = building.flats[flat_name]

  if prospect && flat && flat.vacant?
    flat.tenants[prospect.name] = prospect
    puts "\n#{prospect_name} has been allocated #{flat_name}."
  else
    puts "Either the flat or the prospect name is invalid."
  end
end

def list_occupied_flats(building)
  occupied_flats = building.flats.select { |key, flat| !flat.vacant?}
  if occupied_flats.empty?
    "There are no occupied flats."
  else
    occupied_flats.keys.join(", ")
  end
end

def evict_tenant(building)
  print "\nWhich flat (#{list_occupied_flats(building)})? "
  flat_name = gets.chomp
  flat = building.flats[flat_name]

  if flat && !flat.vacant?
    print "\nEvict which tenant (#{flat.tenants.keys.join(", ")})? "
    eviction_decision = gets.chomp
    if flat.tenants[eviction_decision]
      flat.tenants.delete(eviction_decision)
      puts "\n#{eviction_decision} has been evicted."
    else
      puts "\nInvalid choice."
    end
  elsif flat && flat.vacant?
    puts "\nThis flat is vacant."
  else
    puts "\nInvalid choice." 
  end
end







