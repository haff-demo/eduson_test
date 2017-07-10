class BaseApiController < ActionController::API
    before_action :authenticate_user!
  
    private
     
    def current_api_user
      if request.headers[:authentication].present?
        @current_user ||= User.find_by(auth_token: request.headers[:authentication]) 
      end
    end 

    def authenticate_user!
      head :unauthorized unless current_api_user
    end 
end
