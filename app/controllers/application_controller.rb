class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def after_sign_in_path_for(resource)
    stored_location_for(resource) || courses_path
  end
  
  def after_sign_out_path_for(resource)
    stored_location_for(resource) || root_path
  end
  
  def authorize_admin
    if current_user.present?
      redirect_to root_path, status: 401 unless current_user.admin
    else
       redirect_to root_path, status: 401
    end
    #redirects to previous page
  end
  
  def authorize_user
    redirect_to root_path, status: 401 unless current_user.present?
    #redirects to previous page
  end
  
end
