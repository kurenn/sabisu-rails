module Sabisu
  class Header < Struct.new(:name, :value)

    def raw
      { "#{name}" => "#{value}" }
    end
  end 
end
