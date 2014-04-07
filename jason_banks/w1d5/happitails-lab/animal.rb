class Animal

  attr_accessor :name, :type, :age, :sex, :client

  def initialize (name, type, age, sex, client={})
    @name = name
    @type = type
    @age = age
    @sex = sex
    @client = client
  end

  def to_s
    return_choice = "#{name}, a(n) #{type}, age #{age} and #{sex}."
    return_choice << "The owner is #{client}." if !client.empty?
    return_choice

  end









end
