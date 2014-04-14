class Stock < DBBase

  attributes symbol: :string, name: :string, holding: :intiger, current_price: :decimal, created_on: :timestamp, portfolio_id: :intiger

  def self.table_name
    :stocks
  end

  def initialize(params={})
    @id = params['id']
    @symbol = params['symbol']
    @name = params['name']
    @holding = params['holding']
    @current_price = params['current_price']
    @created_on = current_timestamp
    @portfolio_id = params['portfolio_id']

  end

  def category
    Category.find(category_id)
  end

end