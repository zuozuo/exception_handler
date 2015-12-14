module ExceptionHandler
  class Engine < ::Rails::Engine
    isolate_namespace ExceptionHandler
  end
end
