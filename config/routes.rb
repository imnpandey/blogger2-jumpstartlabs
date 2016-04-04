Rails.application.routes.draw do
  root 'articles#index'
  get 'tags' => 'tags#index'
  resources :articles do
    resources :comments
  end
  resources :tags
end
