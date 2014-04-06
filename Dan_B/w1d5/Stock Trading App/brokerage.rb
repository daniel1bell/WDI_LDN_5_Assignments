class Brokerage
attr_accessor :name, :clients

  def initialize(name)
    @name = name
    @clients = {}
    # @balance = clients.values_at(stock_value).inject{|sum,x| sum + x}
  end

  def view_client
    if !clients.empty?
      puts "#{clients.each {|x, y|  print y.to_s}}"
    else
      puts "There are currently no clients. Please add a client and try again."
    end
  end

  def add_client
    print "What is the client name? "
    client_name = gets.chomp.capitalize
    print "What is the portfolio name?"
    portfolio_name = get.chomp.capitalize


  end

end