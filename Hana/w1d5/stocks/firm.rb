class Firm
  attr_accessor :name
  attr_reader :clients

  def initialize(name)
       @name = name
       @clients = {}
  end

  def list_client_info
    if clients.any?
      clients.values.join("\n")
    else
      "You have no clients. Go get some!"
    end
  end

end