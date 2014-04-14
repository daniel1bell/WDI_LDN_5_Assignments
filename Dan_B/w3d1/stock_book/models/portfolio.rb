class Portfolio <DBBase

  attributes name: :string, description: :text, category_id: :integer

  def self.table_name
    :portfolios
  end

  def initialize(params={})
    @id = params['id']
    @name = params['name']
    @description = params['description']
    @category_id = params['category_id']
  end

  def category
    Category.find(category_id)
  end

end