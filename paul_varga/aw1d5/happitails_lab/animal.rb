class Animal
  attr_accessor :name, :breed, :age, :gender, :toys

  def initialize(name, breed, age, gender, toys)
    @name = name
    @breed = breed
    @age = age
    @gender = gender
    @toys = toys
  end

  def to_s
    return_value = "#{name}: a #{gender} #{breed}, who is #{age} years old and loves #{toys}."
    # return_value << ". Currently owned to: #{list_clients}" if clients.any?
    # return_value
  end

end
