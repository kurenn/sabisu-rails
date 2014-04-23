module Sabisu
  class RequestBuilder
    include HTTParty

    base_uri Sabisu.base_api_uri
    headers Sabisu.api_headers

    def initialize(resource, resource_id = nil, http_method = 'get', body_params = {})
      @resource = resource 
      @http_method = http_method.to_s
      @body_params = body_params
      @resource_id = resource_id
    end

    def response 
      self.class.send(@http_method, "/#{@resource}/#{@resource_id}", body: @body_params)
    end
  end
end
