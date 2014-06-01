class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # Overwriting the sign_in redirect path method
  def after_sign_in_path_for(resource_or_scope)
    current_user.admin ? nominations_path : new_nomination_path
  end

  def render_404
    render :template => 'errors/404', :status => 404, :layout => true
  end

  def render_422
    render 'errors/422', :status => 422
  end


#  rescue_from ActionController::RoutingError, :with => :render_404
 # rescue_from ActionController::UnknownAction, :with => :render_404
#  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  
end
