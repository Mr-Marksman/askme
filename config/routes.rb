Rails.application.routes.draw do
<<<<<<< HEAD
  
  resources :questions do
    put :hidden, on: :member, to: "questions#hide"
  end
  resource :session, only: %i[create new destroy]
  resources :users, exept: %i[index]
=======
  put 'questions/:id/hide', to: "questions#hide"
  resources :questions
  resources :users, only: %i[create new]
>>>>>>> 4ac2bd659353386c0a3544f6164712a829b188b2
end
