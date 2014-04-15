class Stock < DBBase

  attributes symbol: :string, name: :string, holding: :integer, current_price: :decimal, portfolio_id: :integer

  def self.table_name
    :stocks
  end

  def initialize(params={})
    @id = params['id']
    @symbol = params['symbol']
    @name = params['name']
    @holding = params['holding']
    @bought_price = params['bought_price']
    prices = []
    @current_price = prices.last
    @portfolio_id = params['portfolio_id']

    # get_code = YahooFinance::get_standard_quotes('@symbol')['@symbol']

    # @name << get_code.name
    # @bought_price << get_code.lastTrade
  end

  def category
    Category.find(category_id)
  end

  def current_value
    get_code = YahooFinance::get_standard_quotes('self.symbol')['self.symbol']
    @current_price << get_code.lastTrade
    @current_price.last
  end

end