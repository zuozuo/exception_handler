require_dependency "exception_handler/application_controller"

module ExceptionHandler
  class ErrorsController < ApplicationController
    def not_found
    end

    def unauthorized
    end

    def server_error
    end
  end
end
