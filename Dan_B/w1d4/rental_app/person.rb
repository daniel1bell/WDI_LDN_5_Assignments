class Person
  attr_accessor :name, :phone, :budget


  def initialize(name, phone)
    @name = name
    @phone = phone
    @budget = []
  end

end