require 'rails/railtie'

module Sabisu
  class Railtie < ::Rails::Railtie
    config.eager_load_namespaces << Sabisu

    ActiveSupport.on_load :active_record do
      if Sabisu.resources.empty?
        Sabisu.resources = Sabisu::RouteRecognizer.new.resources 
        Sabisu.default_resource = Sabisu.resources.first.to_s
      end
      Sabisu.app_name = Rails.application.class.parent_name
    end

    config.after_initialize do
      unless Sabisu.configured?
        warn '[Sabisu] Sabisu is not configured in the application and will use the default values.' +
          ' We recommend you to check the file just created with the installer and setup it up.'
      end
    end
  end
end
