class WelcomeController < ApplicationController
  
  def index
  end

  def nomination_instructions
  end

  def thanks
  end
  
  def pseudo_logout
    redirect_to root_path, :notice => "Your nomination data has been saved."
  end
end
