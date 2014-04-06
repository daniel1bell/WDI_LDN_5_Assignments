class Client
attr_accessor :name, :cash, :portfolios, :password, :stock_value, :balance

  def initialize(name, cash, password)
    @name = name
    @cash = cash
    @password = password
    @portfolios = {}
    @stock_value = stock_value
    @balance = balance
  end

  # stock_value = portfolios.each{|name, values| values.inject{|sum,x| sum + x}}
  # balance = stock_value+cash

  def to_s
    if portfolios.empty?
      "#{name}:\t Cash Balance:   $#{cash.round(2)}\n(#{name} currently has no portfolios.)\n\n"
    else
      "\n#{name}:\t Cash Balance:   $#{cash.round(2)}\n\n"
    end
  end

  def check_password(client)
    puts "\nClient: what is your super secure password?"
    submit_pass = gets.chomp
    unless submit_pass == client.password
       print "\nAh ah ah, you didn't say the magic word!"
       gets
       print "\nAh ah ah, you didn't say the magic word!"
       gets
       print "\nAh ah ah, you didn't say the magic word!"
       gets
       puts `clear`
       Kernel.exit(false)
    end 
  end





end