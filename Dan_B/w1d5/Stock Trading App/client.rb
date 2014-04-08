class Client
attr_accessor :name, :cash, :portfolios, :password, :stock_value, :balance

  def initialize(name, cash, password)
    @name = name
    @cash = cash
    @password = password
    @portfolios = {}
  end

  def stock_value
    sv_array = portfolios.map {|code, info| info.total}
    sv_array.compact!
    unless sv_array.empty?
      sv_array.reduce(:+)
    end
  end

  def balance
    cash + stock_value
  end

  def to_s
    if portfolios.empty?
      "#{name}:\tCash Amount:   $#{cash.round(2)}\\n(#{name} currently has no portfolios.)\n\n"
    else
      "\n#{name}:\tCash Amount:   $#{cash.round(2)}\tPortfolios Value:    $#{stock_value}\tAccount Balance:    $#{balance}\n\n"
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