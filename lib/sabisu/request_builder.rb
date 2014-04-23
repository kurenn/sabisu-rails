module Sabisu
  class RequestBuilder
    include HTTParty

    base_uri Sabisu.base_api_uri
    headers Sabisu.api_headers

    def initialize(resource, uri_pattern, http_method = 'get', body_params = {})
      @resource = resource 
      @http_method = http_method.to_s
      @body_params = body_params
      @uri_pattern = uri_pattern
    end

    def response 
      self.class.send(@http_method, "/#{@resource}/#{@uri_pattern}", body: @body_params)
    end
  end
end
