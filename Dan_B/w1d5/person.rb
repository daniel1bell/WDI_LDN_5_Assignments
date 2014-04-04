class Person
  attr_accessor :name, :pets, :phone

  def initialize(name, phone)
    @name = name
    @phone = phone
    @pets = {}
  end

  def to_s
    "Name:\t#{name}\nPhone:\t#{phone}\n\t#{pets}\n"
  end
end
