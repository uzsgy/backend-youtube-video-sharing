Rails.application.routes.draw do
  scope module: "users" do
    post "login", to: "users#login"
    resources :users do
      member do
        post :change_password
      end
    end
  end
end
