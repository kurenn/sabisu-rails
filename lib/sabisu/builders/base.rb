module Sabisu
  module Builders
    class Base < Struct.new(:name, :value)

      def raw
        { "#{name}" => "#{value}" }
      end
    end
  end
end
