require 'sinatra'
require 'date'
get '/' do erb :index end
get '/countdown' do erb :countdown end