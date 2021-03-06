class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  # To override devise to allow editing registration fields 
  before_action :configure_permitted_parameters, if: :devise_controller?

  def upgrade_current_user
    current_user.premium!
  end
    
  def downgrade_current_user
    current_user.standard!
    current_user.wikis.update_all(:private => "false")
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
