module Sabisu
  class Explorer
    attr_reader :resource, :uri_pattern, :http_method

    def initialize(attrs = {})
      @resource = attrs[:resource]
      @uri_pattern = attrs[:uri_pattern]
      @http_method = attrs[:http_method].downcase || "get"
    end

    # Method to retrieve the resource class name, such as User, Product, etc
    def resource_class
      @resource_class ||= @resource.singularize.classify.constantize 
    end

    def resource_columns
      resource_class.columns
    end
    
  end
end
