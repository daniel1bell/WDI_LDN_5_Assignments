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
    if flats.select { |key, flat| flat.vacant? }.empty?
      print "No empty flats"
    else
      vacant_flats = flats.select { |key, flat| flat.vacant? }
      vacant_flats.keys.join(', ')
    end
  end

  def list_prospects   
      if prospects.empty? 
        puts "No prospects. "
      else 
        print "Prospects are: "
        prospects.keys.join(', ')
      end
  end

  def list_tenants
      flats.each do |name , flat| 
        print "In flat #{name} there is: "
        if flat.tenants.empty?
          puts "No Tenants"
        else
          puts flat.tenants.keys.join(", ")     
        end
      end
  end

  def create_prospect
    puts "Create a new prospect. "
    puts "what is the persons name?"
    prosepect_name = gets.chomp
    puts "What is the persons phone number? "
    prospect_number = gets.chomp

    prospects[prosepect_name] = Person.new(prosepect_name, prospect_number)
    puts "#{prosepect_name} has been added"
    list_prospects
  end


end

