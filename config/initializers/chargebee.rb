site = (Rails.env == 'development' || Rails.env == 'testing') ? Rails.application.credentials.local_site : Rails.application.credentials.prod_site
api_key = (Rails.env == 'development' || Rails.env == 'testing') ? Rails.application.credentials.chargebee[:test_full_access] : Rails.application.credentials.chargebee[:live_full_access]

ChargeBee.configure(:site => "#{site}", 
  :api_key => api_key)