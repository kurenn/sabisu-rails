require 'rails/railtie'

module SabisuRails
  class Railtie < ::Rails::Railtie
    config.eager_load_namespaces << SabisuRails

    ActiveSupport.on_load :active_record do
      if SabisuRails.resources.empty?
        SabisuRails.resources = SabisuRails::RouteRecognizer.new.resources 
        SabisuRails.default_resource = SabisuRails.stringyfied_resources.first
      end
      #SabisuRails.resources.map!(&:to_s)
      SabisuRails.app_name = Rails.application.class.parent_name
    end

    config.after_initialize do
      unless SabisuRails.configured?
        warn '[Sabisu] Sabisu is not configured in the application and will use the default values.' +
          ' We recommend you to check the file just created with the installer and setup it up.'
      end
    end
  end
end
