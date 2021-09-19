class SubscribersController < ApplicationController
  skip_after_action :verify_authorized

  def create
    gibbon = Gibbon::Request.new
    if email = params[:subscriber][:email].presence
      email = email.downcase
      email_hash = Digest::MD5.hexdigest(email)
      Gibbon::Request.lists(ENV['MAILCHIMP_LIST_ID']).members(email_hash).upsert(body: { email_address: email, status: 'subscribed' })
      interests = Gibbon::Request.lists(ENV['MAILCHIMP_LIST_ID']).members(email_hash).retrieve(params: { fields: 'interests' }).body['interests']
      interests[ENV['MAILCHIMP_INTEREST_ID']] = true
      Gibbon::Request.lists(ENV['MAILCHIMP_LIST_ID']).members(email_hash).update(body: { interests: interests })
      session[:subscribed] = true
    else
      head :unprocessable_entity
    end
  end
end
