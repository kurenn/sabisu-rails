# Use this module to configure the sabisu available options

Sabisu.setup do |config|

  # Base uri for posting the 
  # config.base_api_uri = nil 

  # Ignored attributes for building the forms
  # config.ignored_attributes = %w{ created_at updated_at id }
  
  # HTTP methods
  # config.http_methods = %w{ GET POST PUT DELETE PATCH }
  
  # Headers to include on each request
  # config.api_headers = {}

  # Layout configuration
  # config.layout = "sabisu"

  # Resources on the api
  # config.resources = [:products, :users...]

  # Application name
  # mattr_accessor :app_name
  # @@app_name = Rails.application.class.parent_name

end
