Rails.application.routes.draw do
  get "/", to: proc { [200, {}, [""]] }
  resources :users do
    collection do
      get "me"
    end
  end
  post "register", to: "authentications#register"
  post "login", to: "authentications#login"
end
