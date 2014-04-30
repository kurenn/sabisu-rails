module Sabisu
  module Builders
    class UrlParamsBuilder < Struct.new(:name, :value)

       def raw
        { "#{name}" => "#{value}" } 
       end
    end
  end
end
