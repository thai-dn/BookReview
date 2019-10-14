Rails.application.config.middleware.use OmniAuth::Builder do
  # HEROKU
  provider :heroku, ENV.fetch("HEROKU_OAUTH_ID"), ENV.fetch("HEROKU_OAUTH_SECRET")
end