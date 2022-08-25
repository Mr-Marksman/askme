Rails.application.routes.draw do
  
  resources :questions do
    put :hidden, on: :member, to: "questions#hide"
  end
  resource :session, only: %i[create new destroy]
  resources :users, only: %i[create new]
end
