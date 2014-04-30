module Sabisu
  class ExplorerController < Sabisu::BaseController

    def index
      @resources = Sabisu.resources
      @explorer = Sabisu::Explorer.new(params[:explorer])
      @response = Sabisu::RequestBuilder.new(@explorer, params[@explorer.resource_name], params[:explorer]).response
    end

  end
end
