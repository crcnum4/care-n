
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fitbit, '228CFG', 'c3f3de68b6ac2b1ca90657cecb5ceb04', scope: "activity profile"
end