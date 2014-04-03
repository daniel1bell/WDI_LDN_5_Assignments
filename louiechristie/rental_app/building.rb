class Building
  attr_accessor :post_code, :affluency, :flats
  attr_reader :flats, :prospects

  def initialize(post_code)
    @post_code = post_code
    @flats = {}
    @prospects = {}
  end

  def list_flats
    flats.keys.join(', ')
  end

  def list_empty_flats
    vacant_flats = flats.select { |k,flat| flat.vacant? }
    vacant_flats.keys.join(', ')  
  end

  #def list_tenants
  #    flats.each do |name, flat| 
  #      flat.tenants.each do |key, tenant|
  #        #return tenant.name (same below without return)
  #        puts tenant.name
  #      end
  #    end
  #end

  # with map it returns an array of array(tenants for each flat)
  def list_tenants
    tenants = flats.map do |name, flat| 
      flat.tenants.map do |key, tenant|
        #return tenant.name (same below without return)
        tenant.name
      end
    end
    tenants = tenants.flatten.join(', ').inspect
  end

  def evict_tenant(tenant_name)

  end

  def create_prospect
    # to do define method 
  end

  def list_prospects
    # to do define method 
    prospects.keys.join(', ')
  end

end