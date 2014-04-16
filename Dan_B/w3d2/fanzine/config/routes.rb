Fanzine::Application.routes.draw do
  
  get '/band' => 'home#band'
  get '/michael' => 'home#michael'
  get '/jermaine' => 'home#jermaine'
  get '/tito' => 'home#tito'
  get '/jackie' => 'home#jackie'
  get '/marlon' => 'home#marlon'
  get '/tour' => 'home#tour'
  root :to => 'home#band'

end
