Rails.application.routes.draw do
  namespace :v1 do
    resources :survivors do
      resources :reports, only: %i[show index create]
      resources :items, only: %i[show index]
    end

    get 'reports/infected'
    get 'reports/non_infected'
    get 'reports/survivors_inventory'
    get 'reports/points_lost'
  end
end
