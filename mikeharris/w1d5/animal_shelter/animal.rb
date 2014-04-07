class Animal 

attr_accessor :name, :breed, :age, :gender,  :toys
 

def initialize (name, breed, age, gender, toys)
  @name = name
  @breed = breed
  @age = age
  @gender = gender
  @toys = toys
  
end

 def to_s
    return_value = "#{name}: #{gender} #{breed} who is #{age} years old and loves #{toys}"
end


end
