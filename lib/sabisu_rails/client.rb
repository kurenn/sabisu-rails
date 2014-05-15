module SabisuRails
  module Client
    module ClassMethods

      def setup_client
        base_uri SabisuRails.base_api_uri
        headers SabisuRails.api_headers
        headers "Accept" => "application/#{SabisuRails.api_format}"
        headers "Content-Type" => "application/#{SabisuRails.api_format}"
        basic_auth SabisuRails.basic_auth_username, SabisuRails.basic_auth_password if SabisuRails.basic_auth_header?
        digest_auth SabisuRails.digest_auth_username, SabisuRails.digest_auth_password if SabisuRails.digest_auth_header?
        format SabisuRails.api_format
      end
    end
  end
end
