RandTech::Application.routes.draw do
  root to: 'home#index'
  match '/AddrSubmit', to: 'addr#submit', via: [:post]
end
