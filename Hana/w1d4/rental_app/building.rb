
require 'pry'
class Building
  attr_accessor :post_code, :affluency, :flats, :prospects

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

def evict_tenant
  prints "Which tenant needs to be evicted?"
  evicted = gets.chomp
  flats.each do |name, flat|
      flat.tenants.delete(evicted)
        print "#{evicted}"
      
    end
end

def list_empty_flats
  vacant_flats = flats.select {|key,flat| flat.vacant?}
  
  if vacant_flats.any?
    vacant_flats.keys.join(', ')
  else
    puts "There are no vacant flats."
  end
end

def list_tenants
  flats.each do |name, flat|
    flat.tenants.each do |tenant, id|
      puts tenant
    end
  end
end


def create_prospect
  puts "Welcome to the Building!"
  puts "What is the prospect's name?"
  prospects_name = gets.chomp
  puts "What is the prospect's phone-number?"
  prospects_phone = gets.chomp

  @prospects[prospects_name] = Person.new(prospects_name, prospects_phone)
  "Your new prospect is #{prospects[prospects_name].name} and his/her phone number is #{prospects[prospects_name].phone}."
end


end