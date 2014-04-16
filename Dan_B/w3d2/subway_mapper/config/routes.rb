SubwayMapper::Application.routes.draw do

  get '/route' => 'home#start'
  root :to => 'home#start'



end
