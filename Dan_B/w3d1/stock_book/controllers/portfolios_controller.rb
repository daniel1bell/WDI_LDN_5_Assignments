get '/portfolios' do
  @portfolios = Portfolio.all

  erb :'portfolios/index'
end

get '/portfolios/new' do
  @portfolio = Portfolio.new
  @categories = Category.all
  erb :'portfolios/new'
end

post '/portfolios' do
  @portfolio = Portfolio.new(params[:portfolio])
  @portfolio.save

  redirect to('/portfolios')
end

get '/portfolios/:id/edit' do
  @portfolio = Portfolio.find(params[:id])
  @categories = Category.all

  erb :'portfolios/edit'
end

get '/portfolios/:id' do
  @portfolio = Portfolio.find(params[:id])

  erb :'portfolios/show'
end

post '/portfolios/:id' do
  @portfolio = Portfolio.find(params[:id])
  @portfolio.update_attributes(params[:portfolio])
  redirect to("/portfolios")
end

get '/portfolios/:id/delete' do
  Portfolio.find(params[:id]).destroy
  redirect to('/portfolios')
end

get '/portfolios/:id/stocks' do
  @portfolio = Portfolio.find(params[:id])

  erb :'stocks/search'
end

get '/portfolios/:id/stocks/new' do
  @stock = Stock.new

  erb :'stocks/new'
end

post '/portfolios/:id/stocks' do
  @portfolio = Portfolio.find(params[:id])
  @stock = Stock.new(params[:stock])
  @stock.save

  redirect to('/portfolios')
end