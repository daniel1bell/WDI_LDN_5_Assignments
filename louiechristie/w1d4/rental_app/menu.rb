def menu
  puts `clear`
  puts "*** Welcome to Building Management v.01 (beta) ***"
  puts "1 : List Flats"
  puts "2 : List Prospects"
  puts "3 : Let Flat"
  puts "4 : Evict Tenant"
  puts "5 : List Empty Flats"
  puts "6 : List Tenants"
  puts "7 : Create Prospect"
  #create flat
  #edit flat
  puts "q : Quit"
  print '---> '
  gets.chomp
end

def let_flat(building)
  print 'Which flat? '
  print "(#{building.list_flats}) "
  flat_name = gets.chomp
  print 'Which prospect? '
  print "(#{building.list_prospects}) "

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
  print 'Which tenant? '
  print "(#{building.list_tenants}) "
  tenant_name = gets.chomp

  building.flats.each do |name, flat|
    flat.tenants.delete(tenant_name)
  end
end

def create_prospect(building)
  print 'Prospects name? '
  prospect_name = gets.chomp

  print 'Prospects phone number? '
  prospect_phone = gets.chomp

  if building.prospects.has_key?(prospect_name)
    puts "Name already exists, use a different name."
  else
    building.prospects[prospect_name] = Person.new(prospect_name, prospect_phone)
  end
end