class Animal < Tetrapod
  attr_accessor :species, :toys

  def initialize(name, age, gender, species)
    super(name, age, gender)
    @species = species
    @toys = []
  end

  def to_s
    "#{@name} is a #{@age} year old #{@gender} #{@species} that loves #{@toys.join(', ')}"
  end
end
