module Sabisu
  class ExplorerController < Sabisu::BaseController

    def index
      @response = { products: {title: 'A title'} }.to_json
    end

  end
end
