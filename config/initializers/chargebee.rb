site = Rails.env == 'development' ? Rails.application.credentials.local_site : Rails.application.credentials.dev_site
api_key = Rails.application.credentials.chargebee[:test_full_access]

ChargeBee.configure(:site => "#{site}", 
  :api_key => api_key)