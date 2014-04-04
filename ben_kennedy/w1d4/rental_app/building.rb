class Building
  attr_accessor :post_code, :affluency, :prospects
  attr_reader :flats

  def initialize(post_code)
    @post_code = post_code
    @flats = { }
    @prospects = { }

  end

  def list_flats
    flats.keys.join(', ')
  end

  def list_empty_flats
    vacant_flats = flats.select { |key, flat| flat.vacant?}
    if vacant_flats.empty? 
      puts "There are no empty flats"
    else
    vacant_flats.keys.join(', ')
    end

  end

  def list_prospects
    puts "There are not prospects" if !prospects.keys
    prospects.keys.join(', ')
  end

  def list_tenants
    flats.each { |name, flat| puts flats[name].tenants.keys }
    puts "Hit enter to return to main menu."
  end

  def create_prospect
    puts "What is the person's name?"
    name = gets.chomp
    puts "What is the person's phone number?"
    number = gets.chomp
    puts "A new propsect has been created."
    puts "Hit enter to return to the main menu"
    Person.new(name, number)
  end


end