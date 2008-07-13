# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '61d398d456fe882d3f3ac7d5c28b5ed2'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  before_filter :authenticate

  helper_method :current_user 

  protected  
  def authenticate  
    if request.format == :rss
      if user = authenticate_with_http_basic { |u, p| User.find_by_login_and_password(u, p) }
        session[:user] = user.id
      else
        request_http_basic_authentication 'Usuário requerido'
      end
    else
      unless session[:user]
        session[:return_to] = request.request_uri
        redirect_to login_path
      end
    end    
  end
    
  def current_user 
    @current_user ||= User.find(session[:user]) if session[:user] 
  end  
end
