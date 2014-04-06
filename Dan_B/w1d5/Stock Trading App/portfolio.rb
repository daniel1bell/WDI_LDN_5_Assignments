class Portfolio
attr_accessor :name, :stocks

  def initialize(name)
    @name = name
    @stocks = {}
    # @value = stocks.values_at(value).inject{|sum,x| sum + x}
  end

  def to_s
    if stocks.empty?
      "#{name} doesn't yet contain any stocks."
    else
      "#{name}:\tTotal Portfolio Value of $value with stocks in:\n\t#{stocks.values.join("\n\t")}"
    end
  end


end