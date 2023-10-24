class ApplicationController < ActionController::API
    #protect_from_forgery with: :null_session
  
    include ActionController::Cookies


    def current_user
        @current_user = User.find_by(id: session[:user_id])
    end

    def authorize 
        return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
      end
end