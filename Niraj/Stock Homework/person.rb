class Client
    attr_accessor :name, :cash, :portfolios

    def initialize(name, cash)
      @name = name
      @cash = cash
      @portfolios = {}
   end

    def list_clients
      clients.each do |name, cash|
        client.money.each do |name, cash|
          puts cash.name
        end
      end
    end




end


