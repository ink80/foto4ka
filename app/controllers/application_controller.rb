class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    root_path
    # if current_user.has_role?(:admin)
    #   dashboard_path
    # elsif current_user.has_role?(:student)
    #   root_path
   #end
  end
  

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :avatar, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:username, :email, :password, :current_password, :avatar)
    end
  end
end
