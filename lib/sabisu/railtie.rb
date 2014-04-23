require 'rails/railtie'

module Sabisu
  class Railtie < Rails::Railtie
    config.eager_load_namespaces << Sabisu

    config.after_initialize do
      unless Sabisu.configured?
        warn '[Sabisu] Sabisu is not configured in the application and will use the default values.' +
          ' We recommend you to check the file just created with the installer and setup it up.'
      end
    end
  end
end
