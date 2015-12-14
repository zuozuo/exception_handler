ExceptionHandler::Engine.routes.draw do
  get 'errors/not_found'

  get 'errors/unauthorized'

  get 'errors/server_error'

	match '*unmatched_route', :to => 'errors#not_found', :via => :all
end
