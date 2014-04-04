def menu

	puts `clear`
	puts "*** Welcome to Building Management v1.0 ***"

	puts "1: List Flats"
	puts "2: List Prospects"
	puts "3: Let Flat"
	puts "4: Evict Tenant"
	puts "5: List Empty Flats"
	puts "6: List Tenants"
	puts "7: Create a Pospect"
	puts "8: Quit"
	print "--->"
	gets.chomp

end

def let_flat(building)

	print "Which Flat?"
	print "#{building.list_empty_flats}"
	flat_name = gets.chomp
	print "Which Prospect?"
	print "#{building.list_prospects}"
	prospect_name = gets.chomp

	prospect = building.prospects.delete(prospect_name)

	flat = building.flats[flat_name]

	if prospect && flat && flat.vacant?
		flat.tenants[prospect.name] = prospect
		puts "Congratulations! #{prospect_name} has moved into #{flat_name}. Party at #{prospect_name}'s!"
	else
		puts "Either the name or flat is invalid!."
	end

	puts "Press Enter to continue."

end

