class Building
  attr_accessor :post_code, :affluency
  attr_reader :flats, :prospects

  def initialize(post_code)
    @post_code = post_code
    @flats = {}
    @prospects = {}    
  end

  def vacant_flats
    flats.select { |key,flat| flat.vacant? }
  end

  def occupied_flats
    flats.reject { |key,flat| flat.vacant? }
  end

  def list_flats
    if flats.any?
      flats.values.join("\n")
    else
      "There are no flats at the moment.\nGo drum up some landlords!"
    end
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

  def list_vacant_flats
    if vacant_flats.any?
      vacant_flats.keys.join(', ')
    else
      "There are no vacant flats.\nGo get some more on the books!"
    end
  end

  def list_occupied_flats
    if occupied_flats.any?
      occupied_flats.keys.join(', ')
    else
      "There are no occupied flats.\nGet some tenants, or you're looking for a new job!"
    end
  end

  def list_prospects
    if prospects.any?
      prospects.keys.join(', ')
    else
      "There are no prospects.\nGet out there and drag people in off the street if you have to!"
    end
  end

  def potential_monthly_income
    "£%.2f" % occupied_flats.values.inject(0) { |sum, flat| sum + flat.price.to_f}.to_s # uses the `sprintf` formats on the returned string: http://ruby-doc.org/core-2.0.0/String.html#method-i-25 and http://ruby-doc.org/core-2.0.0/Kernel.html#method-i-sprintf
  end

end
