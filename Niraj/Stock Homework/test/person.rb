class Client
    # attr_accessor :name, :cash, :portfolios
    attr_accessor :name, :balance


    def initialize(name, balance)
      @name = name
      @balance = balance
      @portfolios = {}
   end


      def list_clients
        unless clients.empty?
          clients.each do |name, cash|
            puts name
          end
        end
      end

    

    # def list_clients
    #   clients.each do |name, cash|
    #     client.money.each do |name, cash|
    #       puts cash.name
    #       print clients
    #     end
    #   end
    # end

    def view_client

      puts "Which client would you like to view in more detail?"
      client_name = gets.chomp
      if brokerage.clients.has.key? #("#{client_name}")
        list_clients
        puts
        "#{client_name} has the following portfolios:"
      end
    end





end


