class ApplicationController < ActionController::Base
  before_action :set_locale

  include Pundit
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  helper_method :current_user
  helper_method :logged_in?

  rescue_from 'Pundit::NotAuthorizedError' do
    redirect_to root_path
  end

  def set_locale
    I18n.locale = 'de-CH'
  end

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
end
