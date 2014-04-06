class Client
attr_accessor :name, :cash, :portfolios, :password

  def initialize(name, cash)
    @name = name
    @cash = cash
    @portfolios = {}
    # @stock_value = portfolios.values_at(value).inject{|sum,x| sum + x}
    # @balance = stock_value+cash
    @password = password
  end

  def to_s
    if portfolios.empty?
      "#{name}:\t Cash Balance:   $#{cash}\n\t#{name} currently has no portfolios"
    else
      "#{name}:\t Cash Balance:   $#{cash}\n\n\t#{name} currently has the following portfolios:\n\t#{portfolios.each {|x,y| puts y.to_s}}"
    end
  end

  def check_password(submit_pass)
    unless submit_pass == password
       puts "Ah ah ah, you didn't say the magic word!"
    end 
  end





end