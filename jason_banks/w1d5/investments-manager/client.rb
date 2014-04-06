class Client

  attr_accessor :name, :phone, :portfolios
  attr_reader :opening_balance, :current_balance, :investments_balance

  def initialize(name, phone, opening_balance)
    @name = name
    @phone = phone
    @opening_balance = opening_balance.to_f
    @portfolios = {}
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

  def calculate_investments
    @investments_balance = portfolios.each.portfolio_balance.reduce { |sum, n| sum + n }
  end

  def calculate_current_balance
    @current_balance = investments_balance - opening_balance
    if @current_balance < 0
      @current_balance = 0
    end
  end

  def buy_stock
    print "\nStock Symbol: "
    stock_symbol = gets.chomp.upcase
    loop do
      if portfolios.keys.include?(stock_symbol)
        puts "#{stock_symbol}"
    end
  end

  def balance_check(stock_symbol, units)
    stock_price = YahooFinance::get_standard_quotes(stock_symbol)[stock_symbol].lastTrade
    proposal = stock_price * units
    proposal > current_balance ? false : true
  end























end