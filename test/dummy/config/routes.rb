Rails.application.routes.draw do

  mount ExceptionHandler::Engine => "/exception_handler"
end
