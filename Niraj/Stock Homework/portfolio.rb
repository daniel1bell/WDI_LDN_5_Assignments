class Portfolio

attr_accessor :name, :type
attr_reader :stocks

  def initialize(type)
    # @name=name
    @type=type
    @stocks = {}
  end



end


