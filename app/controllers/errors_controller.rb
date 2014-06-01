class ErrorsController < ApplicationController
  def render_404
    render 'errors/404', :status => 404
  end

  def render_422
    render 'errors/422', :status => 422
  end

end
