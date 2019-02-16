Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope :api do
    get "/", to: proc { [200, {}, [""]] }
    resources :users
    post "register", to: "authentications#register"
    post "login", to: "authentications#login"
    post "authenticate", to: "authentications#authenticate"
  end
end
