def request_phase
    redirect client.auth_code.authorize_url({:redirect_uri => callback_url}.merge(authorize_params))
end

# 消した
        
# Omniauth::Strategy
def callback_url
  full_host + callback_path + query_string
end