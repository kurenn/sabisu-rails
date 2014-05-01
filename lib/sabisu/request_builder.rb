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
      @url_params = []
      header_params if @params[:headers].present?
      url_params if @params[:url_params].present?
    end

    def request_headers
      @headers.each_with_object(Hash.new) do |header, hash|
        hash[header.name] = header.value unless header.value.blank?
      end
    end

    def request_url_params
      @url_params.each_with_object(Hash.new) do |param, hash|
        hash[param.name] = param.value unless param.value.blank?
      end
    end

    def response 
      self.class.send(@explorer.http_method, "/#{@explorer.resource}/#{@explorer.uri_pattern}", body: resource_body_params, headers: request_headers, query: request_url_params)
    end

    def resource_body_params
      body_params = {}

      body_params[@explorer.resource_name] = @body_params.reject { |k, v| v.blank? }

      body_params 
    end

    def url_params 
      url_params =  @params[:url_params].reject { |k,v| v.blank? }
      index = 1
      url_params.each do |k,v|
        name = v["url_params_name_#{index}"] 
        value = v["url_params_value_#{index}"] 
        @url_params << Sabisu::Builders::UrlParamsBuilder.new(name, value)
        index += 1
      end
    end

    def header_params
      headers =  @params[:headers].reject { |k,v| v.blank? }
      index = 1
      headers.each do |k,v|
        name = v["header_name_#{index}"] 
        value = v["header_value_#{index}"] 
        @headers << Sabisu::Builder::HeadersBuilder.new(name, value)
        index += 1
      end
    end
  end
end
