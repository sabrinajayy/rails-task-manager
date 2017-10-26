Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :tasks
  match 'tasks/complete', to: 'tasks#complete', via: :post
end
