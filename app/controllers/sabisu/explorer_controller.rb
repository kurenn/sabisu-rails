module Sabisu
  class ExplorerController < Sabisu::BaseController

    def index
      @resources = Sabisu.resources
      @response = Sabisu::RequestBuilder.new(params[:resource], params[:uri_pattern]).response
    end

  end
end
