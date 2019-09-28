Rails.application.routes.draw do
  root 'authors#index'
  get 'books/index'
  get 'books/new'
  get 'books/create'
  get 'books/delete'
  get 'books/edit'
  get 'books/update'
  get 'authors/index'
  get 'authors/create'
  get 'authors/edit'
  get 'authors/update'
  get 'authors/delete'
  get 'authors/new'
    get 'authors/:id', to: 'authors#show'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
