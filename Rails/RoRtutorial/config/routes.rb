Rails.application.routes.draw do
  get 'animals/a'

  get 'animals/b'

  get '/animals/'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
