class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  layout :layout_by_resource

  before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?


  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def after_sign_up_path_for(resource)
    redirect_to new_user_registration_path
  end

  def after_update_path_for(resource)
    redirect_to profile_path(resource)
    flash[:notice] = "Account successfully updated"
  end


  # rescue_from CanCan::AccessDenied do |exception|
  #   respond_to do |format|
  #     format.json { head :forbidden }
  #     format.html { redirect_to root_url, :alert => exception.message }
  #   end
  # end


  rescue_from CanCan::AccessDenied do |exception|
    Rails.logger.debug "Access Denied: #{exception.message}"
    redirect_to request.referer
    flash[:notice] = "Access Denied: You are not authorized to carry out this action"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:username, :first_name, :last_name, :email, :password)
    end

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :first_name, :last_name)}
  end

  def layout_by_resource
    if devise_controller? && resource_name == :user && controller_name == 'sessions' && action_name == "new"
      "layout_blank"
    elsif devise_controller? && resource_name == :user && controller_name == 'passwords'
      "layout_blank"
    elsif devise_controller? and user_signed_in?
      "application"
    else
      "application"
    end
  end

end



