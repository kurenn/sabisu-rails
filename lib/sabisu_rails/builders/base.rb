module SabisuRails
  module Builders
    class Base

      def initialize(params)
        @params = params || {} 
        sanitize_params
      end

      def build
        query_params = {}
        @sanitized_params.each do |k,v|
          values = v.values #returns the nested hash, and we get the values from that hash
        query_params[values[0]] = values[1]
        end
        query_params
      end

      private 

        def sanitize_params
          @sanitized_params = @params.reject { |k,v| v.blank? } 
        end
    end
  end
end
