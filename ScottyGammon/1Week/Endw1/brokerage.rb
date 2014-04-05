class Brokerage
  attr_accessor :clients, :portfolios

  def initialize
    @clients = {}
    @portfolios = {}    
  end

  def empty_clients
    clients.select { |key,client| client.empty? }
  end

  def occupied_clients
    clients.reject { |key,client| client.empty? }
  end

  def list_clients
    if clients.any?
      clients.values.join("\n")
    else
      "There are no clients at the moment.\nPlease add some in the menu."
    end
  end

  def portfolios
    clients.values.inject({}) { |portfolios, client| portfolios.merge(client.portfolios)}
  end

  def list_portfolios
    if portfolios.any?
      portfolios.keys.join(", ")
    else
      "There are no portfolios at the moment.\n Please add some and assign them to clients."
    end
  end

  #def list_vacant_clients
  #  if vacant_clients.any?
  #    vacant_clients.keys.join(', ')
  #  else
  #    "There are no vacant clients.\nGo get some more on the books!"
  #  end
  #end

  #def list_occupied_clients
  #  if occupied_clients.any?
  #    occupied_clients.keys.join(', ')
  #  else
  #    "There are no occupied clients.\nGet some portfolios, or you're looking for a new job!"
  #  end
  # end

  #def list_portfolios
  #  if portfolios.any?
  #    portfolios.keys.join(', ')
  #  else
  #    "There are no portfolios.\nGet out there and drag people in off the street if you have to!"
  #  end
  #end

  #def total_investment
  #  "£%.2f" % occupied_clients.values.inject(0) { |sum, client| sum + client.price.to_f}.to_s # uses the `sprintf` formats on the returned string: http://ruby-doc.org/core-2.0.0/String.html#method-i-25 and http://ruby-doc.org/core-2.0.0/Kernel.html#method-i-sprintf
  #end

end
