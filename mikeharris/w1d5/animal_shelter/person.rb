class Person

  attr_accessor :name, :age, :gender, :kids 
  attr_reader :pets 

  def initialize (name, age, gender, kids)
    @name = name
    @age = age
    @gender = gender
    @kids = kids
    @pets = {}
  end

   def to_s
      return_value = "#{name}: #{gender}  who is #{age} years old has #{kids} kids.\n"
      if pets.any?
        return_value <<  "---- They own these animals: #{persons_animals}"
      else
        return_value<< "They don't own any animals"
      end

      return_value
  end

  def persons_animals
     pets.keys.join(", ")
  end

end
