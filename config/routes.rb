Rails.application.routes.draw do
  get "monthly_goals/index"
  get "monthly_goals/new"
  get "monthly_goals/create"
  get "monthly_goals/edit"
  get "monthly_goals/update"
  get "monthly_goals/destroy"
  get "mandala_items/edit"
  get "mandala_items/update"
  devise_for :users

  resources :annual_themes do
    member do
      get :chart
    end
    resources :monthly_goals
  end

  resources :mandala_items, only: [:edit, :update]

  root to: "annual_themes#index"
end
