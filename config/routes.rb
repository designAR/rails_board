Rails.application.routes.draw do

  root "questions#index"
  resources :questions
  resources :question do
    resources :answers
  end

end
