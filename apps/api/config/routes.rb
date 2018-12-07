# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
get '/home', to: 'home#index'
post 'sign_in', to: 'session#sign_in'
get '/home', to: 'home#index'
get '/session/sign_in', to: 'session#sign_in'

root to: 'home#index'
