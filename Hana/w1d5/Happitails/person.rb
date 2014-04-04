class Person
  attr_accessor :name, :age, :gender
  attr_reader :pets

  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
    @pets = {}
  end

end