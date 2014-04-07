require 'pry'

class Person
  attr_accessor :name, :age, :kids, :pets 
  attr_reader :sex

def initialize(name, age=nil, sex=nil)
  @name = name
  @age = age
  @sex = sex
  @kids = { } 
  @pets = { }
end


end