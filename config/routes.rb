Rails.application.routes.draw do
  
  resources :questions do
    put :hidden, on: :member, to: "questions#hide"
  end
  
  resource :session, only: %i[create new destroy]
  
  scope(path_names: { show: ":nickname" }) do
    resources :users, except: %i[index], param: :nickname
  end 
end
