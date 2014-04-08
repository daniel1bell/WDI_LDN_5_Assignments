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

  def list_prospects
    prospects.keys.join(", ")
  end

  def tenants
    flats.values.inject({}) { |tenants, flat| tenants.merge(flat.tenants)}
  end

  def list_tenants
    if tenants.any?
      tenants.keys.join(", ")
    else
      "There are no tenants at the moment.\nGo let some flats!"
    end
  end

  def list_empty_flats
    vacant_flats = flats.select { |key, flat| flat.vacant? }
    vacant_flats.keys.join(', ')
  end

  def list_occupied_flats
    occupied_flats = flats.select { |key, flat| flat.occupied? }
    occupied_flats.keys.join(', ')
  end

end