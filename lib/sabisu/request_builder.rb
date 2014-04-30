module Sabisu
  class RequestBuilder
    include HTTParty

    base_uri Sabisu.base_api_uri
    headers Sabisu.api_headers

    def initialize(explorer, body_params, params)
      @explorer = explorer
      @body_params = body_params || {}
      @params = params
      @headers = []
      header_params if @params[:headers].present?
    end

    def self.setup_headers(request_headers)
      request_headers.map(&:raw).each do |header_hash|
        headers header_hash if header_hash
      end
    end

    def request_headers
      @headers.each_with_object(Hash.new) do |header, hash|
        hash[header.name] = header.value unless header.value.blank?
      end
    end

    def response 
      self.class.send(@explorer.http_method, "/#{@explorer.resource}/#{@explorer.uri_pattern}", body: resource_body_params, headers: request_headers)
    end

    def resource_body_params
      body_params = {}

      body_params[@explorer.resource_name] = @body_params.reject { |k, v| v.blank? }

      body_params
    end

    def header_params
      headers =  @params[:headers].reject { |k,v| v.blank? }
      index = 1
      headers.each do |k,v|
        name = v["header_name_#{index}"] 
        value = v["header_value_#{index}"] 
        @headers << Sabisu::Header.new(name, value)
        index += 1
      end
    end
  end
end
