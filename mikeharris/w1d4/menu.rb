def menu
  puts `clear`
  puts "***Welcome to Building Management Beta v1"

  puts "1 : List Flats"
  puts "2 : List Prospects"
  puts "3 : Let Flat"
  puts "4 : Evict Tenant"
  puts "5 : List Empty Flats"
  puts "6 : List current tenants"
  puts "7 : Create a Prospect"
  puts "q : Quit"

  print '---> '
  gets.chomp

end

def let_flat(building)
  print "Which flat would you like to let? "
  puts "(#{building.list_empty_flats})"
  flat_name = gets.chomp
  flat = building.flats[flat_name]

  print 'Which  prosepect'
  prosepect_name = gets.chomp

  prospect = building.prospects.delete(prosepect_name)

  if prospect && flat && flat.vacant?
      flat.tenants[prospect.name] = prospect
      puts "#{prosepect_name} has moved into #{flat_name}"
  else
      puts "something is invalid"
  end

  #flat.tenants[prospect.name] = b.prospects[prosepect_name]

end

  





