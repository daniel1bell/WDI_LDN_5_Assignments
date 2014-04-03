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
  puts "6\t:\tList Current Tenants"
  puts "7\t:\tCreate a Prospect"
  print '---> '
  gets.chomp
end

def let_flat(building)
  print "Which flat?"
  print "(#{building.list_empty_flats})"
  flat = gets.chomp
  print "Which prospect? "
  # print "(#{building.list_prospects})"
  prospect_name = gets.chomp

binding.pry

  prospect = Building.prospects.delete(prospect_name)
  flat = building.flats[flat_name]

binding.pry

  if prospect && flat && flat.vacant?
    flat.tenants[prospect.name] = prospect
    "#{prospect.name} has now been assigned to #{flat.name}."
  else
    puts "Either the flat or prospect name is invalid."
  end
  puts "Press enter to continue."

end