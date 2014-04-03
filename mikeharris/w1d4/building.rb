class Building
  attr_accessor :post_code, :affluency 
  attr_reader :flats


  def initialize(post_code)
    @post_code = post_code
    @flats = {}


  end


end
