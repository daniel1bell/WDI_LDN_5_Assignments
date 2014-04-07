class Animal
  attr_accessor :name, :breed, :age, :gender, :fave_toy

  def initialize(name, breed, age, gender, fave_toy)
    @name = name
    @breed = breed
    @age = age
    @gender = gender
    @fave_toy = fave_toy
  end

  def to_s
    "#{name}:\t#{breed}\t#{age} year(s) old\t#{gender}\tFave Toy: #{fave_toy}\n"
  end


end



