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

	def list_prospects
		prospects.keys.join(', ')
		puts "You have the following prospects: #{prospects.keys.join(', ')}."
		puts "Press Enter to continue."
	end

	def list_empty_flats
		vacant_flats = flats.select { |key,flat| flat.vacant? }
		vacant_flats.keys.join(', ')
		puts "Good news! (#{vacant_flats.keys.join(', ')}) is empty!."
		puts "Press Enter to continue." 
	end

	def list_all_tenants
		flats.each do |name, flat|
			flat.tenants.each do |name,tenant|
				puts tenant.name
			end
		end
	end

	def create_prospect

		puts "What is the customers name?"
		prospect_name = gets.chomp
		puts "What is their telephone number?"
		prospect_phone = gets.chomp

		prospects[prospect_name] = Person.new(prospect_name,prospect_phone)

		puts "#{prospect_name} has been added to the database. Press Enter to continue."
	end

	def evict_tenant

		list_all_tenants

		puts "What tenant do you want to evict?"
		evictee = gets.chomp

		flats.each do |name, flat|
			flat.tenants.delete(evictee)
			
		end

	end



end
