class Portfolio
attr_accessor :name, :stocks

  def initialize(name)
    @name = name
    @stocks = {}
  end

  # def total
  #   stocks.values_at
  # end

  def to_s
    if stocks.empty?
      "#{name}: doesn't yet contain any stocks."
    else
      "#{name}:\tTotal Portfolio Value of $#{} with stocks in:\n\t#{stocks.values.join("\n\t")}"
    end
  end


end