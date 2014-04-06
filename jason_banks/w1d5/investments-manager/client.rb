class Client

  attr_accessor :name, :phone, :portfolios
  attr_reader :opening_balance, :current_balance, :investments_balance

  def initialize(name, phone, opening_balance)
    @name = name
    @phone = phone
    @opening_balance = opening_balance.to_f
    @portfolios = {}
  end

  def calc_investments_balance
    investments_balance = 0
    portfolios.each { |portfolio, value| investments_balance += value.calc_portfolio_balance }
    investments_balance
  end

  def calc_investments_start_balance
    investments_start_balance = 0
    portfolios.each { |stock, values| investments_start_balance += values.calc_portfolio_start_balance}
    investments_start_balance
  end

  def calc_current_balance
    opening_balance_after_investments = opening_balance - calc_investments_start_balance
    current_balance = opening_balance_after_investments + calc_investments_balance
    unless current_balance < 0
      current_balance
    else
      0
    end
  end

  # def buy_stock
  #   print "\nStock Symbol: "
  #   stock_symbol = gets.chomp.upcase
  #   loop do
  #     if portfolios.keys.include?(stock_symbol)
  #       puts "#{stock_symbol}"
  #     end
  #   end
  # end

  def balance_check(stock_symbol, additional_units)
    stock_price = YahooFinance::get_standard_quotes(stock_symbol)[stock_symbol].lastTrade
    proposal = stock_price * additional_units
    proposal > calc_current_balance ? false : true
  end

  def to_s
    puts "Client: #{name}"
    puts "  Phone: #{phone}"
    puts "  Portfolios: #{portfolios.keys.join(", ")}"
    puts "  Opening Balance: $#{sprintf("%.2f", opening_balance)}"
    puts "  Current Balance: $#{sprintf("%.2f", calc_current_balance)}\n"

  end



end