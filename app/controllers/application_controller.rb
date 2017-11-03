class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception #, unless: :api_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate
  # https://www.pluralsight.com/guides/ruby-ruby-on-rails/token-based-authentication-with-ruby-on-rails-5-api

  # def current_user_is_admin?
  #   current_user.is_admin?
  # end

  # rescue_from CanCan::AccessDenied do |exception|
  #   redirect_to main_app.root_path, :alert => exception.message
  # end

  protected

  # def api_controller?
  #   params[:controller].split('/').first == 'api'
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:workshop_key])
  end

  # def after_sign_in_path_for(resource)
  #   user_path(resource)
  # end

  # Authenticate the user with token based authentication
  def authenticate
    return true if public_action?
    if request.format.json?
      render_json_unauthorized unless authenticate_token
    else
      authenticate_user!
    end
  end

  def public_action?
    ( controller_name == 'homes' && action_name == 'show' ) ||
    # ( controller_name == 'client_apps' && action_name == 'index' ) ||
    ( controller_name == 'fake_posts' && action_name == 'create' )
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      @current_user = User.find_by(api_token: token)
    end
  end

  def render_json_unauthorized #(realm = "Application")
    # allow_cross_site_json_requests
    # self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
    render plain: 'Invalid API token', status: :unauthorized
  end

end
