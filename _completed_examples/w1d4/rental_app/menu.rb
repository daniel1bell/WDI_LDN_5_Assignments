def menu
  puts `clear`
  puts "*** Welcome to Building Management v.01  (beta) ***"
  puts "1 : List Flats"
  puts "2 : List Prospects"
  puts "3 : Let Flat"
  puts "4 : Evict Tenant"
  puts "5 : List Vacant Flats"
  puts "6 : List Tenants"
  puts "7 : Create a Prospect"
  puts "8 : Create a Flat"
  puts "9 : Potential Monthly Income"
  puts "q : Quit"
  print '---> '
  gets.chomp
end


def let_flat(building)
  print 'Which flat? '
  print "(#{building.list_vacant_flats}) "
  flat_name = gets.chomp

  flat = building.flats[flat_name]

  if flat
    print 'Which prospect? '
    print "(#{building.list_prospects}) "
    prospect_name = gets.chomp
  end

  prospect = building.prospects.delete(prospect_name) if flat

  if flat && flat.vacant? && prospect
    flat.tenants[prospect.name] = prospect
    puts "#{prospect_name} has moved into #{flat_name}"
  else
    errors = []
    errors << "prospect name is invalid" if flat && !prospect
    errors << "flat name is invalid" unless flat
    errors << "flat is not vacant" if flat && !flat.vacant?

    puts "The #{errors.join(' and the ')}."
  end
end

def evict_tenant(building)
  print 'Which flat? '
  print "(#{building.list_occupied_flats}) "
  flat_name = gets.chomp

  flat = building.flats[flat_name]

  if flat
    print 'Which tenant? '
    print "(#{flat.list_tenants}) "
    tenant_name = gets.chomp
  end

  tenant = flat.tenants.delete(tenant_name) if flat

  if flat && tenant
    puts "Tenant #{tenant_name} has been evicted."
  else
    errors = []
    errors << "tenant name is invalid" if flat && !tenant
    errors << "flat name is invalid" unless flat

    puts "The #{errors.join(' and the ')}."    
  end
end

def create_prospect(building)
  print 'What is their name? '
  name = gets.chomp

  case 
    when name.empty?
      puts "You must enter a name."
  
    when building.tenants.keys.include?(name)
      puts "That name has already been taken by existing tenant"
      
    when building.prospects.keys.include?(name)
      puts "That name has already been taken by existing prospect"

    else
      print 'What is their phone number? '
      phone = gets.chomp

      building.prospects[name] = Person.new(name, phone)
      puts "#{name} has been created as a prospect"
  end
end


def create_flat(building)
  print 'What is its name? '
  name = gets.chomp

  case 
    when name.empty?
      puts "You must enter a name."

    when building.flats.keys.include?(name)
      puts "That name has already been taken by existing flat"

    else
      print 'What is the price? '
      price = gets.chomp

      print 'How many bedrooms? '
      bedrooms = gets.chomp

      print 'How many bathrooms? '
      bathrooms = gets.chomp

      building.flats[name] = Flat.new(name, price, bedrooms, bathrooms)
      puts "#{building.flats[name] } has been created."
  end

end




















