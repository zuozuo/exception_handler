module ExceptionHandler
  class Railtie < Rails::Railtie
    ActiveSupport.on_load :action_controller do
      include Handler
    end
  end
end
