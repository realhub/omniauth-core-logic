require 'omniauth/strategies/oauth2'

# Potential scopes: 
# ------
# openid
#
# Separate scopes with a space (%20)

module OmniAuth
  module Strategies
    class CoreLogic < OmniAuth::Strategies::OAuth2
      UAT_URL = 'https://access-uat-api.corelogic.asia'.freeze
      PRODUCTION_URL = 'https://access-api.corelogic.asia'.freeze
      
      option :name, 'core_logic'

      option :client_options,
             authorize_url: '/access/oauth/authorize',
             token_url: '/access/oauth/token'

      uid do
        access_token&.params&.dig("usr_guid")
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      # Overrride client to merge in site based on sandbox option
      def client
        ::OAuth2::Client.new(
          options.client_id,
          options.client_secret,
          deep_symbolize(options.client_options).merge(site: site)
        )
      end

      def callback_url
        options[:redirect_uri] || (full_host + script_name + callback_path)
      end

      private
        def site
          options.uat ? UAT_URL : PRODUCTION_URL
        end

        def raw_info
          return @raw_info if @raw_info

          @raw_info ||= access_token&.params
        end
    end
  end
end