Gibbon::Request.api_key = ENV['MAILCHIMP_API_KEY']
Gibbon::Request.symbolize_keys = false
Gibbon::Request.debug = Rails.env.development?
Gibbon::Request.logger = Rails.logger
