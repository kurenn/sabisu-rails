module Sabisu
  class ExplorerController < Sabisu::BaseController

    def index
      @resources = Sabisu.resources
      @response = Sabisu::RequestBuilder.new(params[:resource], params[:uri_pattern], params[:http_method]).response
    end

  end
end
