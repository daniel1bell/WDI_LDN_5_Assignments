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

  if building.flats.select { |key, flat| flat.vacant? }.empty?
    puts "No empty flats"
  elsif building.prospects.empty?
    puts "No prospects"
  else
    print "Which flat would you like to let? "
    puts "(#{building.list_empty_flats})"
    flat_name = gets.chomp
    flat = building.flats[flat_name]

    print 'Which  prosepect? '
    puts building.list_prospects
    prosepect_name = gets.chomp

    prospect = building.prospects.delete(prosepect_name)

    if prospect && flat && flat.vacant?
        flat.tenants[prospect.name] = prospect
        puts "#{prosepect_name} has moved into #{flat_name}"
    else
        puts "something is invalid"
    end
  end
end


def evict_tenant(building)
  building.list_tenants
  puts "Which tenant would you like to evict?"
  tenant_name = gets.chomp
  
  tenant_exists = false

  building.flats.each do |flat_name, flat|
    tenant_exists = tenant_exists || flat.tenants.key?(tenant_name)
  end
  

  if tenant_exists
    building.flats.each do |flat_name, flat|
      flat.tenants.delete(tenant_name)
    end

    puts "#{tenant_name} has been evicted!"
    building.list_tenants
  else
    puts "no such tenant"
  end

end

  