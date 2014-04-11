Liveapp::Application.routes.draw do
  resources :contacts, only: [:new, :create]
  resources :visitors, only: [:new, :create]
  resources :data1s, only: [:new, :create, :edit, :delete]
  resources :data2s, only: [:new, :create, :edit, :delete]
  resources :data3s, only: [:new, :create, :edit, :delete]
  root to: 'visitors#new'
  get '/entry_edit' => 'visitors#entry_edit', :as => :entry_edit
  get '/entry_new' => 'visitors#entry_new', :as => :entry_new
  get '/render_grid' => 'visitors#render_grid'
  delete '/data1s' => 'data1s#destroy'
  delete '/data2s' => 'data2s#destroy'
  delete '/data3s' => 'data3s#destroy'
  get '/connect_db1' => 'visitors#connect_db1'
  get '/connect_db2' => 'visitors#connect_db2'
  get '/connect_db3' => 'visitors#connect_db3'
end