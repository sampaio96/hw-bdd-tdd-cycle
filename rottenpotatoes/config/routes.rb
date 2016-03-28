Rottenpotatoes::Application.routes.draw do
  resources :movies do
      match 'search_directors' => 'movies#search_directors', via: [:get], as: :search_directors
  end
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
end
