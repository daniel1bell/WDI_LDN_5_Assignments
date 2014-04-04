class Building
	attr_accessor :post_code, :affluency
	attr_reader :flats, :prospects


	def initialize(post_code)
		@post_code = post_code
		@flats = {}
		@prospects = {}
	end

def list_flats
	flats.keys.join(', ')
end

def list_empty_flats
	vacant_flats = flats.select { |key,flat| flat.vacant?}
	vacant_flats.keys.join(', ')
	#flats.select { |key, flat| flat.vacant?} old way of doing it
end

def create_flat
	print "What is the flat's name?"
	flat_name = gets.chomp
	print "Whats is the flat's price?"
	flat_price = gets.chomp
	print "How many bedrooms?"
	flat_bedrooms = gets.chomp
	print "How many bathrooms?"
	flat_bathrooms = gets.chomp
	flats[flat_name] = Flat.new(flat_name, flat_price, flat_bedrooms, flat_bathrooms)
	puts "You have created #{flat_name}, a flat with #{flat_bedrooms} bedrooms and #{flat_bathrooms} baths, for the cost of #{flat_price}."
	#extra check to make sure it is a unique name
end

def create_prospect
	print "What is the person's name?"
	prospect_name = gets.chomp.downcase
	print "Whats is the person's phone number?"
	prospect_phone = gets.chomp
	prospects[prospect_name] = Person.new(prospect_name, prospect_phone)
	puts "You have created #{prospect_name} with phone number #{prospect_phone}"
	#extra check to make sure it is a unique name
end

def list_prospects
	prospects.keys.join(', ')
end

def list_tenants
flats.each do |name, flat|
  print flat.tenants.keys.join(', ') #Michael changed me to this code in hipchat, my previos code was git commited if you would like to see
end
end



end