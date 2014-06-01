class ApplicationController < ActionController::Base
  protect_from_forgery

  # Overwriting the sign_in redirect path method
  def after_sign_in_path_for(resource_or_scope)
    current_user.admin ? nominations_path : new_nomination_path
  end

  def render_404
    render template: 'errors/404', status: 404, layout: true
  end

  def render_422
    render 'errors/422', status: 422
  end

  private
  
  # For this example, we are simply using token authentication
  # via parameters. However, anyone could use Rails's token
  # authentication features to get the token from a header.
  def authenticate_user_from_token!
    user_token = params[:auth_token].presence
    user       = user_token && User.find_by_authentication_token(user_token.to_s)

    if user
      # Notice we are passing store false, so the user is not
      # actually stored in the session and a token is needed
      # for every request. If you want the token to work as a
      # sign in token, you can simply remove store: false.
      sign_in user #, store: false
    end
  end
end