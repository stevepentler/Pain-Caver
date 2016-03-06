Rails.application.config.middleware.use OmniAuth::Builder do
  provider :strava, ENV['CLIENT_ID'], ENV['SECRET_KEY_BASE'], scope: 'view_private,write'
end