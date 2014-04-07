class Person
	
  attr_accessor :name, :pets, :phone

  def initialize(name, phone)
    @name = name
    @phone = phone
    @pets = {}
  end

end
