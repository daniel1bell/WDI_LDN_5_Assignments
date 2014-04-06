def menu
  puts `clear`
  puts "*** Welcome to Building Management v.01 (beta) ***"
  puts "1 : list Flats"
  puts "2 : list Prospects"
  puts "3 : Let Flat"
  puts "4 : Evict Tenant"
  puts "5 : List Empty Flats"
  puts "6 : List Tenants"
  puts "7 : Create a Prospect"
  puts "q : Quit"
  print '---> '
  gets.chomp
end


def let_flat(building)
  print 'Which flat?'
  print "(#{building.list_empty_flats})"
  flat_name = gets.chomp
  print 'Which prospect? ' #we have to list our prospects
  prospect_name = gets.chomp

  prospect = building.prospects.delete(prospect_name)
  flat = building.flats[flat_name]

  if prospect && flat && flat.vacant?
    flat.tenants[prospect.name] = prospect
    puts "#{prospect_name} has moved into #{flat_name}"
  else
    puts "Either the flat or prospect name is invalid"
  end
  puts "press enter to continue"
end

def evict_tenant(building)
  puts 'Which tenant do you want to evict?'
  building.list_tenants
  tenant_name = gets.chomp
  building.flats.each do |name, flat|
      flat.tenants.delete(tenant_name)
  end
  puts "Remaining tenants are: "
  building.list_tenants
end
