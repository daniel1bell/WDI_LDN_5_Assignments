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
	flats.tenants.each do |name, tenant|
	puts tenant.name
end
end
end



end