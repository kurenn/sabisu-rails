module Sabisu
  class RequestBuilder
    include HTTParty

    base_uri Sabisu.base_api_uri
    headers Sabisu.api_headers

    def initialize(explorer, body_params = {})
      @explorer = explorer
      @body_params = body_params
    end

    def response 
      self.class.send(@explorer.http_method, "/#{@explorer.resource}/#{@explorer.uri_pattern}", body: @body_params)
    end
  end
end
