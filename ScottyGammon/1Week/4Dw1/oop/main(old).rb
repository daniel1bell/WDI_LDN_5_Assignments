require 'pry'

class Person
	attr_accessor(:age, :height) #reader and writer in one, even better. Did this third
	attr_writer :password
	#attr_reader :age, :height
	#attr_writer :age, :height #same as getter and setter... easier this way, did this second
	def initialize(age, height)
		puts "initialize a new person"
		@age = age
		@height = height
	end

	def talk(words)
		puts "I say #{words}"
	end

	def speak
		puts "Good Morning"
	end

=begin
	def age=(age) #this is called a setter arguement
		@age = age
	end

	def age # this is called a getter
		@age #instance variable of a persons age, did this first
	end
=end
end



	bob = Person.new(52, 185)
	scotty = Person.new(28, 190)



binding.pry