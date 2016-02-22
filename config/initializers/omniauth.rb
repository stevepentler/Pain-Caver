Rails.application.config.middleware.use OmniAuth::Builder do
  provider :strava, Rails.application.secrets.strava_client_id, Rails.application.secrets.strava_api_key, scope: 'public'
end