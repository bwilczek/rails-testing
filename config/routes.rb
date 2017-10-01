Rails.application.routes.draw do
  get '/books/avg_page_count(/:author_id)', to: 'books#avg_page_count'
  resources :books
  resources :authors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
