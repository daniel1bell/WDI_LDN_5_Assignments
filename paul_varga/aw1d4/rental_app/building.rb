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

  def list_empty_flats
    vacant_flats = flats.select { |key, flat| flat.vacant? }
    
    if vacant_flats.any?
    vacant_flats.keys.join(', ')
    else
      "There are currently no vacant flats."
    end
  end

  def list_tenants
    @flats.each_pair do |name, flat| 
      flat.tenants.each do |tenant, id| puts tenant 
      end
    end
  end

  def evict_tenant
    list_tenants
    puts "Which tenant do you want to delete?"
    tenant_to_evict = gets.chomp
      @flats.each_pair do |name, flat| 
      flat.tenants.delete(tenant_to_evict)
    end
  end

  def create_prospect
   puts "Welcome to our amazing building"
   puts "What is your name?"
   prospect_name = gets.chomp
   puts "What is your phone number - please enter it without any special character (e.g. 074501111111?)"
   prospect_phone = gets.chomp.to_i
   prospects[prospect_name] = Person.new(prospect_name, prospect_phone)
  end


end