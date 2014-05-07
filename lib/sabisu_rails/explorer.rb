module SabisuRails
  class Explorer

    include SabisuRails::Helpers::Required

    attr_reader :resource, :uri_pattern, :http_method

    def initialize(attrs = {})
      @resource = attrs[:resource] || SabisuRails.default_resource
      @uri_pattern = attrs[:uri_pattern]
      @http_method = attrs[:http_method].nil? ? "get" : attrs[:http_method].downcase
    end

    # Method to retrieve the resource class name, such as User, Product, etc
    def resource_class
      @resource_class ||= @resource.singularize.classify.constantize 
    end

    def resource_name
      @resource_name ||= @resource.singularize 
    end

    def resource_columns
      resource_class.columns
    end
    
    def resource_attributes
      resource_columns.map(&:name) - SabisuRails.ignored_attributes
    end

    def method_missing(meth, *args, &block)
      resource_class.new.send(meth, *args, &block)
    end
  end
end
