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

  def create_prospect
    puts "New Prospect name: "
    new_prospect_name = gets.chomp
    puts "New Prospect phone: "
    new_prospect_phone = gets.chomp
    prospects[new_prospect_name] = Person.new(new_prospect_name, new_prospect_phone)
  end


end