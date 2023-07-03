Rails.application.routes.draw do
  scope module: :users do
    post "login", to: "users#login"
    resources :users, only: [:show, :create] do
      member do
        post :change_password
      end
    end
  end

  scope module: :videos do
    resources :videos, except: %i[new edit update]
  end
end
