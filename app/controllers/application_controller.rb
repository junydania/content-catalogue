class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout :layout_by_resource

  before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?



  protected

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:username, :first_name, :last_name, :email, :password)
    end
  end

  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == "new"
      "layout_blank"
    else
      "application"
    end
  end

end


