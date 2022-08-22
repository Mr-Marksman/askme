Rails.application.routes.draw do
  put 'questions/:id/hide', to: "questions#hide"
  resources :questions
  resources :users, only: %i[create new]
end
