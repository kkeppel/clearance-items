Rails.application.routes.draw do

  resources :items do
    collection { post :import }
  end

  root 'items#index'

end
