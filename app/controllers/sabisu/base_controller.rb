module Sabisu
  class BaseController < ApplicationController

    layout Sabisu.layout

    before_filter :authenticate

    protected

      def authenticate
        authenticate_or_request_with_http_basic do |username, password|
          username == Sabisu.authentication_username && password == Sabisu.authentication_password
        end
      end
  end
end
