ActionController::Routing::Routes.draw do |map|
# Rails.application.routes do |map|
  map.resource :account, :controller => "users"
  map.resources :users
  map.resource :user_session
  # map.root :controller => "user_sessions", :action => "new"

  map.connect '/account/getting_started', :controller => 'users', :action => 'getting_started'

  # facebook integration
  map.connect 'connect', :controller => 'login', :action => 'connect'
  map.connect '/fb/:action', :controller => 'fb_connect'
end
