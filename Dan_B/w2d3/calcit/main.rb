require 'pry'
require 'sinatra'
require 'sinatra/contrib/all'
require 'sinatra/reloader' if development?

get '/' do
  erb :home
end

post '/navigate' do
  case params[:destination].downcase
  when 'calculator' then redirect to('/simple')
  when 'mortgage' then redirect to('/mortgage')
  when 'bmi' then redirect to('/bmi')
  when 'trip' then redirect to('/trip')
  when 'pythagoras' then redirect to('/pythagoras')
  else
    erb :error
  end
end

get '/simple' do
  @first = params[:first].to_f
  @second = params[:second].to_f
  @operator = params[:operator]

  @result = case @operator
    when "+" then @first + @second
    when "-" then @first - @second
    when "*" then @first * @second
    when "/" then @first / @second
    when "p" then @first ** @second
    when "sqr" then Math.sqrt(@first)
  end

  erb :simple
end

get '/mortgage' do
  @principal = params[:principal].to_f
  @m_i_rate = (params[:i_rate].to_f) /100 /12
  @n_payments = (params[:payment_yrs].to_f) *12

  @mortgage_result = @principal * ((@m_i_rate * ((1 + @m_i_rate)) ** @n_payments)/(((1 + @m_i_rate) ** @n_payments) - 1))

  erb :mortgage
end

get '/bmi' do
  @weight_measure = params[:weight_measure]
  if @weight_measure == 'lb'
    @weight = (params[:weight].to_f) *0.453592
  else
    @weight = (params[:weight].to_f)
  end
  @height_measure = params[:height_measure]
  if @height_measure == 'inches'
    @height = (params[:height].to_f) /0.393700787/100
  else
    @height = (params[:height].to_f) /100
  end

  @bmi_result = @weight / (@height **2)
  erb :bmi
end

get '/trip' do
  @distance_measure = params[:distance_measure]
  if @distance_measure == 'miles'
    @distance = (params[:distance].to_f)
  else
    @distance = (params[:distance].to_f) * 0.621371192
  end
  @f_efficiency = (params[:f_efficiency].to_f)
  @f_cost = (params[:f_cost].to_f) /100
  @speed_measure = params[:speed_measure]
  if @speed_measure == 'miles'
    @speed = (params[:speed].to_f)
  else
    @speed = (params[:speed].to_f) * 0.621371192
  end

  @time = @distance/@speed
  @cost = (@distance/@f_efficiency) * (@f_cost * 4.54609188)

  erb :trip
end

get '/pythagoras' do
  @side_1_select = params[:side_1_select]
  @side_1_length = (params[:side_1_length]).to_f
  @side_2_select = params[:side_2_select]
  @side_2_length = (params[:side_2_length]).to_f

  if (@side_1_select == 'opposite' && @side_2_select == 'adjacant') || (@side_1_select == 'adjacant' && @side_2_select == 'opposite')
    @pythag_result = Math.sqrt((@side_1_length**2) + (@side_2_length**2))
  elsif (@side_1_select == 'opposite' && @side_2_select == 'hypotenuse') || (@side_1_select == 'adjacant' && @side_2_select == 'hypotenuse')
    @pythag_result = Math.sqrt((@side_2_length**2) - (@side_1_length**2))
  elsif (@side_1_select == 'hypotenuse' && @side_2_select == 'opposite') || (@side_1_select == 'hypotenuse' && @side_2_select == 'adjacant')
    @pythag_result = Math.sqrt((@side_1_length**2) - (@side_2_length**2))
  end

  erb :pythagoras
end












