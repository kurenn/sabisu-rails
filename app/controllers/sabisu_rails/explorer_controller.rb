module SabisuRails
  class ExplorerController < SabisuRails::BaseController

    def index
      @resources = SabisuRails.stringyfied_resources
      @explorer = SabisuRails::Explorer.new(params[:explorer] || {})
      @response = SabisuRails::Request.new(@explorer, params[@explorer.resource_name], params[:explorer]).response
      respond_to do |format|
        format.html
        format.js
      end
    end

  end
end
