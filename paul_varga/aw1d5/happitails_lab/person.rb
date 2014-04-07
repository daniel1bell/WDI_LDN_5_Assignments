class Person
  attr_accessor :name, :age, :gender, :kids
  attr_reader :pets

  def initialize(name, age, gender, kids )
    @name = name
    @age = age
    @gender = gender
    @kids = kids
    @pets = {}

  def to_s
    return_value = "#{name}: a #{gender} client, who is #{age} years old and has #{kids} kids.\n"
    if pets.any? 
      return_value << "The person owns #{owned_animals}."
    else 
      "Currently not a pet owner."
    end
    
    return_value
  end

  def owned_animals
    pets.keys.join(', ')
  end

  end
end