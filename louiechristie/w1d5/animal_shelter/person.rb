class Person
  attr_accessor :name, :age, :gender
  attr_reader :pets

  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
    @pets = {}
  end


# get read of brackets, make condition if the client has no pets.
def to_s
"#{name}, is #{age} y.o., a #{gender} and has the following pets: #{pets.keys}."
end

end