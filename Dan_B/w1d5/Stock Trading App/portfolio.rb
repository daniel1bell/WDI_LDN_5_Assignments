class Portfolio
attr_accessor :name, :stocks

  def initialize(name)
    @name = name
    @stocks = {}
  end

  def total
    port_array = stocks.map {|code, info| info.value}
    port_array.compact!
    unless port_array.empty?
      port_array.reduce(:+)
    end
  end

  def to_s
    if stocks.empty?
      "#{name}: doesn't yet contain any stocks."
    else
      "#{name}:\tTotal Portfolio Value of $#{total.round(2)} with stocks in:\n\t#{stocks.values.join("\n\t")}"
    end
  end


end