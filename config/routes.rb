RandTech::Application.routes.draw do
  root to: 'home#index'
  match '/AddrSubmit', to: 'addr#submit', via: [:post]
  match '/GetStance', to: 'stance#get', via: [:post]
end
