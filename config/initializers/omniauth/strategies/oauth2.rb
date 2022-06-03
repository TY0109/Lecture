def request_phase
    redirect client.auth_code.authorize_url({:redirect_uri => callback_url}.merge(authorize_params))
end

# OmniAuth::Strategies::OAuth2
def build_access_token
    verifier = request.params["code"]
    client.auth_code.get_token(verifier, {:redirect_uri => callback_url}.merge(token_params.to_hash(:symbolize_keys => true)), deep_symbolize(options.auth_token_params))
end
        
# Omniauth::Strategy
def callback_url
  full_host + callback_path + query_string
end