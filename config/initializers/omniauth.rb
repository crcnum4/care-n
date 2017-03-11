Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fitbit_oauth2, ENV['228CFG'], ENV['c3f3de68b6ac2b1ca90657cecb5ceb04']
end