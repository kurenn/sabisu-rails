module Sabisu
  class ExplorerController < Sabisu::BaseController

    def index
      @resources = Sabisu.resources
      @response = Sabisu::RequestBuilder.new(params[:resource]).response
    end

  end
end
