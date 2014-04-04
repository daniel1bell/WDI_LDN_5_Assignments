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
    end

    def list_tenants
      flats.each do |name, flat|
        flat.tenants.each do |name, tenant|
          puts tenant.name
        end
      end
    end

    def evict_tenant
      list_tenants
      puts "Who would you like to evict?"
      evicted_person = gets.chomp
      flats.each do |name, flat|
        flat.tenants.delete(evicted_person)
        end
       puts "#{evicted_person} has been deted from the database"
    end

    def list_empty_flats
  vacant_flats = flats.select { |key,flat| flat.vacant? }
  vacant_flats.keys.join(', ')
  puts "Good news! (#{vacant_flats.keys.join(', ')}) is empty!."
  puts "Press Enter to continue." 
  end


    def create_prospect
      puts "Enter name"
      prospects_name = gets.chomp
      puts "Enter phone number"
      phone_number = gets.chomp

     prospects[prospects_name] = Person.new(prospects_name, phone_number)
     puts "#{prospects_name} and #{phone_number} has been added to the database"
    end

end