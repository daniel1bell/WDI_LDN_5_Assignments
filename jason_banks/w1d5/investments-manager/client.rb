class Client

  attr_accessor :name, :phone, :portfolios
  attr_reader :opening_balance, :current_balance

  def initialize(name, phone, opening_balance)
    @name = name
    @phone = phone
    @portfolios = {}
    @opening_balance = opening_balance.to_f
    @current_balance = @portfolios.values.investment.reduce { |sum, i| sum + i }
  end


  def to_s
    puts "Client: #{name}"
    puts "  Phone: #{phone}"
    puts "  Portfolios: #{portfolios.keys.join(", ")}"
    puts "  Opening Balance: $#{sprintf("%.2f", opening_balance)}"
    puts "  Current Balance: $#{sprintf("%.2f", current_balance)}"
    if current_balance < opening_balance
    puts "\n"
  end

  def calculate_portfolio
  end

  def buy_stock
    print "\nStock Symbol: "
    stock_symbol = gets.chomp.upcase
    loop do
      if portfolios.keys.include?(stock_symbol)
        puts "#{stock_symbol}"
    end
  end
























end