module Sabisu
  class Explorer
    attr_reader :resource, :uri_pattern, :http_method

    def initialize(attrs = {})
      @resource = attrs[:resource]
      @uri_pattern = attrs[:uri_pattern]
      @http_method = attrs[:http_method] || "get"
    end
  end
end
