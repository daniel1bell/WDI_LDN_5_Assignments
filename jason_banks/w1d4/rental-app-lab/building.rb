class Building

  attr_accessor :post_code, :affluency
  attr_reader :flats, :prospects

  def initialize(post_code)
    @post_code = post_code
    @flats = {}
    @prospects = {}

  end

  def list_flats
    flats.keys.join(", ")
  end

  def list_empty_flats
    vacant_flats = flats.select { |key, flat| flat.vacant?}
    if vacant_flats.empty?
      return "There are no empty flats."
      else
        vacant_flats.keys.join(", ")
    end
  end





end