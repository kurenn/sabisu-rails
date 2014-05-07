module SabisuRails
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__) 

      desc "Creates a Sabisu initializer in your application"

       def copy_initializer
        template "sabisu_rails.rb", "config/initializers/sabisu_rails.rb"
       end

       def mount_sabisu_engine
         route %Q(mount SabisuRails::Engine => "/sabisu_rails") 
       end
    end
  end
end
