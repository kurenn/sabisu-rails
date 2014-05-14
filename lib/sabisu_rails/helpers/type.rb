module SabisuRails
  module Helpers
    module Type

      def column_type(col)
        columns.select { |column| column[0] == col }.flatten[1]
      end

      def columns
        @columns ||= resource_class.columns.map{|c| [c.name, c.type] }
      end
    end
  end
end
