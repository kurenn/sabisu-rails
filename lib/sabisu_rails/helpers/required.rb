module SabisuRails
  module Helpers
    module Required

      def required_attribute?(attr)
        required_attributes.include? attr.to_sym 
      end

      def required_attributes
        @required_attributes ||= resource_class.validators.map(&:attributes).flatten.uniq
      end
    end
  end
end
