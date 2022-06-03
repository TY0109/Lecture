class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :create


    def create
      p "auth_hash", auth_hash
      p "info", auth_hash.info
    end
  
    private
  
    def auth_hash
      request.env['omniauth.auth']
    end
end
