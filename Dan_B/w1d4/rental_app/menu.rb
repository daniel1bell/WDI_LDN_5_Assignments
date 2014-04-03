def menu
  puts `clear`
  puts "******* Welcome to Building Management v.01 (beta) *******\n"
  puts "Welcome to your freindly Rental App!"
  puts
  puts "1\t:\tList Flats"
  puts "2\t:\tList Prospects"
  puts "3\t:\tLet a Flat"
  puts "4\t:\tEvict a Tenant"
  puts "5\t:\tList Empty Flats"
  puts "6\t:\tList Tenants"
  puts "7\t:\tAdd a Prospect"
  print "---> \t"
  gets.chomp
end

def let_flat(building)
  if (building.list_empty_flats).empty?
    puts "Sorry, there are no empty flats right now."
  else
    print "Which flat?"
    print "(#{building.list_empty_flats})\n"
    flat_name = gets.chomp
    print "Which prospect? "
    print "(#{building.list_prospects})\n"
    prospect_name = gets.chomp

    prospect = building.prospects.delete(prospect_name)
    flat = building.flats[flat_name]

  if prospect && flat && flat.vacant?
    flat.tenants[prospect.name] = prospect
    puts "#{prospect.name} has now been assigned to #{flat.name}."
  else
    puts "Either the flat or prospect name is invalid."
  end
  end
end

def evict_tenant(building)
  if (building.list_occupied_flats).empty?
    puts "Sorry, there are no tennants in flats to be evicted."
  else
    print "Which flat? "
    print "(#{building.list_occupied_flats})\n"
    flat_name = gets.chomp
    print "Which tenants? "
    print "Tenants"  #{}"(#{list_tenants})\n"
    tenant_name = gets.chomp

    flat = building.flats[flat_name]
    tenant = building.tenants.delete(prospect_name)
  end
  # if tenant && flat && flat.occupied?
  #   flat



  
binding.pry  
end

