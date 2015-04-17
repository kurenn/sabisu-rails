module SabisuRails
  class Explorer

    include SabisuRails::Helpers::Required
    include SabisuRails::Helpers::Type

    attr_reader :resource, :uri_pattern, :http_method

    def initialize(attrs = {})
      @resource = attrs[:resource] || SabisuRails.default_resource
      @uri_pattern = attrs[:uri_pattern]
      @http_method = attrs[:http_method].nil? ? "get" : attrs[:http_method].downcase
    end

    # Method to retrieve the resource class name, such as User, Product, etc
    def resource_class
      @resource_class ||= @resource.to_s.singularize.camelize.constantize
    end

    def resource_name
      @resource_name ||= @resource.to_s.singularize
    end

    def resource_columns
      resource_custom_columns.reject { |column| SabisuRails.ignored_attributes.include? column }
    end
    
    def method_missing(meth, *args, &block)
      resource_class.new.send(meth, *args, &block)
    end

    def get?
      @http_method == "get" 
    end

    def delete?
      @http_method == "delete" 
    end

    def require_body_params?
      !(get? || delete?)
    end

    private

      def resource_custom_columns
        columns = nil
        SabisuRails.resources.each do |resource|
          if resource.is_a?(Hash) && resource[@resource.to_sym].present?
            columns = resource[@resource.to_sym].map(&:to_s)           
          end
        end
        columns || resource_class.columns.map(&:name)
      end

  end
end
