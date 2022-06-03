Rails.application.config.middleware.use OmniAuth::Builder do
    require 'omniauth/strategies/line'
    provider :line, ENV['LINE_KEY'], ENV['LINE_SECRET']
end
