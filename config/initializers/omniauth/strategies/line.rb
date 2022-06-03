require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Line < OmniAuth::Strategies::OAuth2

      # IDトークンからemailを取得するために'email'が必要
      # IDトークンからプロフィール画像を取得するのに'profile'が必要
      option :scope, 'openid email profile'

      option :client_options, {
        site:          'https://api.line.me',
        authorize_url: 'https://access.line.me/oauth2/v2.1/authorize',
      # 消したOK
      }

      # 消したOK

      private

      # nonceをリクエストパラメータに追加するためoverride
      def authorize_params
        super.tap do |params|
          params[:nonce] = SecureRandom.uuid
          session["omniauth.nonce"] = params[:nonce]
          
          params[:client_id] = 1657162701
          session["omniauth.client_id"] = params[:client_id]
        end
      end

      # デフォルトだとクエリパラメータがついてエラーになるのでoverride
      def callback_url
        full_host + script_name + callback_path
      end

      # 消したOK
    end
  end
end

