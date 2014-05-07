module SabisuRails
  class Request
    include HTTParty

    base_uri SabisuRails.base_api_uri
    headers SabisuRails.api_headers

    def initialize(explorer, body_params, params)
      @explorer = explorer
      @body_params = body_params || {}
      @params = params || {}
      @headers = SabisuRails::Builders::HeadersBuilder.new(@params[:headers]).build
      @url_params = SabisuRails::Builders::UrlParamsBuilder.new(@params[:url_params]).build
    end

    def response 
      self.class.send(@explorer.http_method, "/#{@explorer.resource}/#{@explorer.uri_pattern}", body: resource_body_params, headers: @headers, query: @url_params)
    end

    def resource_body_params
      body_params = {}

      body_params[@explorer.resource_name] = @body_params.reject { |k, v| v.blank? }

      body_params 
    end
  end
end
