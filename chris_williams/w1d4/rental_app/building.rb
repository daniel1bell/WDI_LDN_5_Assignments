class Building
  attr_accessor :post_code, :affluency 
  attr_reader :flats, :prospects

  def initialize (post_code)
    @post_code = post_code
    @flats = {}
    @prospects = {}
  end

  def list_flats
    flats.keys.join(', ')
  end

  def list_empty_flats
    vacant_flats = flats.select {|key,flat| flat.vacant? }
    vacant_flats.keys.join(', ')
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
    puts "who would you like to evict? "
    list_tenants
    evicted_tenant = gets.chomp.to_s
    # binding.pry
    flats.each do |name, flat|
      flat.tenants.delete(evicted_tenant)
    end
    puts 'tenant deleted'
  end

 #  def create_prospect
 #      print 'what is your prospects name? '
 #      prospect_name = gets.chomp
 #      print 'what is your propects phone #? '
 #      prospect_number = gets.chomp
 #      binding.pry
 # +    prospects[prospect_name] = Person.new(prospect_name, prospect_number)
 #      puts "prospect created"
 #    end

end