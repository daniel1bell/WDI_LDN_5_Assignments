def menu
  puts `clear`
  puts "*** Welcome to Building Management v.01 (beta) ***"
  puts "1 : list flats"
  puts "2 : list prospects"
  puts "3 : let flat"
  puts "4 : evict tenant"
  puts "5 : list empty flats"
  puts "6 : list tenants"
  puts "7 : create prospect"
  puts "q : quit"
  print '---> '
  gets.chomp

end

def let_flat(building)
  print 'which flat? '
  print "(#{building.list_empty_flats})"
  flat_name = gets.chomp
  print 'which prospect? '
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

