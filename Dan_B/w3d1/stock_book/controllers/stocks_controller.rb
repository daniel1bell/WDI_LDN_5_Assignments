get '/portfolios/:id/stocks' do
  @portfolio = Portfolio.find(params[:id])

  erb :'stocks/search'
end

get '/portfolios/:id/stocks/new' do
  @portfolio = Portfolio.find(params[:id])
  @stock = Stock.new

  erb :'stocks/new'
end

post '/portfolios/:id/stocks' do
  @portfolio = Portfolio.find(params[:id])
  @stock = Stock.new(params[:stock])
  @stock.save

  redirect to('/portfolios')
end