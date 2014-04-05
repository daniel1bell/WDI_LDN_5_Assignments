class Client

  attr_accessor :name, :phone, :balance, :portfolios

  def initialize (name, phone, balance)
    @name = name
    @phone = phone
    @balance = balance.to_f
    @portfolios = {}
  end

  def to_s
    puts "Client: #{name}"
    puts "  Phone: #{phone}"
    puts "  Balance: $#{sprintf("%.2f", balance)}"
    puts "  Portfolios: #{portfolios.keys.join(", ")}"
    puts "\n"
  end























end