class Person
  attr_accessor :name, :pets, :phone

  def initialize(name, phone)
    @name = name
    @phone = phone
    @pets = {}
  end

  def to_s
    if pets.empty?
      puts
      "Name:\t#{name}\nPhone:\t#{phone}\n"
    else
      puts
      "Name:\t#{name}\nPhone:\t#{phone}\n\n\t#{name} has the following pets:\n\t#{pets.values.join("\t")}"
    end
  end
end
