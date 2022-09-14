Rails.application.routes.draw do
  resources :hashtags, only: [:show], param: :body
  
  resources :questions do
    put :hidden, on: :member, to: "questions#hide"
  end
  
  resource :session, only: %i[create new destroy]
  
  resources :users, except: [:index], param: :nickname
end
