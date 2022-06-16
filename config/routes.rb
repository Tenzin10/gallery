Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "photo_galleries#index"
  resources :photo_galleries do
    resources :photos
  end
end
