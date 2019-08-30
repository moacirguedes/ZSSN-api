Rails.application.routes.draw do
  namespace :v1 do
    resources :survivors do
      resources :reports, only: %i[show index create]
      resources :items, only: %i[show index]
    end
  end
end
