require 'httparty'

module SabisuRails
  extend ActiveSupport::Autoload

  autoload :Client
  autoload :Request
  autoload :RouteRecognizer
  autoload :Explorer
  autoload :Helpers
  autoload :Builders

  # We ignore some attribues that might cause a collision between models
  @@default_ignored_attributes = %w{ created_at updated_at id }

  # We append the extra attributes you want to ignore to the default ones
  mattr_accessor :ignored_attributes
  @@ignored_attributes = @@ignored_attributes.to_a + @@default_ignored_attributes

  # Base api uri for the endpoints
  mattr_accessor :base_api_uri
  @@base_api_uri = nil

  # HTTP methods for the api
  @@default_http_methods = %w{ GET POST PUT DELETE PATCH }

  mattr_accessor :http_methods
  @@http_methods = @@http_methods.to_a + @@default_http_methods

  # Headers to include on each request
  mattr_accessor :api_headers
  @@api_headers = {}

  # Layout
  mattr_accessor :layout
  @@layout = "sabisu"

  # Resources
  mattr_accessor :resources
  @@resources = []

  mattr_reader :resources_names

  # Authentication
  mattr_accessor :authentication_username
  @@authentication_username = "admin"

  mattr_accessor :authentication_password
  @@authentication_password = "sekret"

  # Application name
  mattr_accessor :app_name
  @@app_name = 'Sabisu'

  # Sets the default format for requests to the api, :json, :xml
  mattr_accessor :api_format
  @@api_format = :json

  # Sets basic_auth headers
  mattr_accessor :basic_auth_username
  @@basic_auth_username = nil

  mattr_accessor :basic_auth_password
  @@basic_auth_password = nil


  # Sets the digest_auth header credentials
  mattr_accessor :digest_auth_username
  @@digest_auth_username = nil

  mattr_accessor :digest_auth_password
  @@digest_auth_password = nil

  mattr_accessor :default_resource

  @@configured = false

  def self.configured? #:nodoc:
    @@configured  
  end

  def self.resources_names
    @@resources_names ||= @@resources.map { |resource| resource.is_a?(Hash) ? resource.keys[0].to_s : resource.to_s }
  end

  def self.basic_auth_header?
    @@basic_auth_username.present? && @@basic_auth_password.present?
  end

  def self.digest_auth_header?
    @@digest_auth_username.present? && @@digest_auth_password.present?
  end

  #Method to configure sabisu
  def self.setup
    @@configured = true

    yield self
  end

end

require 'sabisu_rails/railtie' 
require 'sabisu_rails/engine'
require 'sabisu_rails/version'
