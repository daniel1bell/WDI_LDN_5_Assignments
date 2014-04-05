class Client

  attr_accessor :name, :phone, :balance, :portfolios
  attr_writer :opening_balance

  def initialize(name, phone, opening_balance)
    @name = name
    @phone = phone
    @opening_balance = balance.to_f
    @balance = @opening_balance - @portfolios.values.investment.reduce { |sum, i| sum + i }
    @portfolios = {}
  end


  def to_s
    puts "Client: #{name}"
    puts "  Phone: #{phone}"
    puts "  Balance: $#{sprintf("%.2f", balance)}"
    puts "  Portfolios: #{portfolios.keys.join(", ")}"
    puts "\n"
  end

  def calculate_portfolio
























end