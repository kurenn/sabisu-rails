module Sabisu
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__) 

      desc "Creates a Sabisu initializer in your application"

       def copy_initializer
        template "sabisu.rb", "config/initializers/sabisu.rb"
       end

       def mount_sabisu_engine
         route %Q(mount Sabisu::Engine => "/sabisu") 
       end
    end
  end
end
