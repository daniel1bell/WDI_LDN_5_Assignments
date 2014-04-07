class Trade
  attr_accessor :ticker, :trade_level, :nos_shares, :current_price

  def initialize (ticker, trade_level, nos_shares)
    @ticker = ticker
    @trade_level = trade_level
    @nos_shares = nos_shares
    @current_prices = trade_level
  end

  def buy_more_shares(trade_level, nos_shares)
    @trade_level = (@trade_level * @nos_shares + trade_level * nos_shares) / (@nos_shares + nos_shares)
    @nos_shares = @nos_shares + nos_shares
  end

  def sell_shares(nos_shares)
    @nos_shares = @nos_shares - nos_shares
  end

  def update_current_price(current_price)
    @current_price = current_price
  end

end



