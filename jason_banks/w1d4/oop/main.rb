require "pry"

class Person

  attr_accessor :age, :height

  def initialize(options = {})
    puts "Initializing a new person."
    @age = options.fetch(:age, 0) # asks if there is a value for the key, if not, sets the key with a value of 0
    @height = options[:height] # makes a new key and sets the value to nil
    
  end

  def talk(words)
    puts "I say, '#{words}'."
  end

  def speak
    puts "Top of the morning, to you!"
  end

end

bob = Person.new(height: 185)
scotty = Person.new(age: 28, height: 180)
michael = Person.new(height: 185, age: 42)
michelle = Person.new





binding.pry