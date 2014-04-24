module Sabisu
  class Explorer

    include Sabisu::Helpers::Required

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

    def resource_name
      @resource_name ||= @resource.singularize 
    end

    def resource_columns
      resource_class.columns
    end
    
    def resource_attributes
      resource_columns.map(&:name) - Sabisu.ignored_attributes
    end

    def method_missing(meth, *args, &block)
      resource_class.new.send(meth, *args, &block)
    end
  end
end
