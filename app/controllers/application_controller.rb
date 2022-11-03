class ApplicationController < ActionController::API
  
  #FOR DEVELOPMENT PURPOSES ONLY
  def current_user
    User.first
  end
end
