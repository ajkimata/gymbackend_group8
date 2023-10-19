# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  # # POST /users/sign_in
  # def create
  #   email = params.dig(:user, :email)&.downcase
  #   password = params.dig(:user, :password)

  #   # Logging sanitized params for debugging
  #   logger.debug "Params received: #{params.except(:password, :password_confirmation).inspect}"

  #   if email && password
  #     authenticate_and_respond(email, password)
  #   else
  #     logger.warn 'Missing email or password in request'
  #     render_unauthorized_response
  #   end
  # end

  # private

  # def authenticate_and_respond(email, password)
  #   logger.info "Attempting to sign in user with email: #{email}"

  #   user = User.find_by(email: email)
  #   if user&.valid_password?(password)
  #     logger.info "User with email: #{email} authenticated successfully"
  #     jwt_token = generate_jwt_token_for_user(user)
  #     response.headers['Authorization'] = "Bearer #{jwt_token}"
  #     render json: {
  #       status: {
  #         code: 200,
  #         message: 'User signed in successfully',
  #         data: {
  #           token: jwt_token,
  #           user: user
  #         }
  #       }
  #     }, status: :ok
  #   else
  #     logger.warn "Failed to authenticate user with email: #{email}"
  #     render_unauthorized_response
  #   end
  # end

  # def generate_jwt_token_for_user(user)
  #   jti = SecureRandom.uuid
  #   user.update(jti: jti) # Store the jti in the user record

  #   payload = {
  #     user_id: user.id,
  #     jti: jti
  #   }

  #   JWT.encode(payload, Rails.application.credentials.fetch(:secret_key_base))
  # rescue StandardError => e
  #   logger.error "Error generating JWT token: #{e.message}"
  #   raise e
  # end

  # def render_unauthorized_response
  #   logger.warn 'Rendered unauthorized response'
  #   render json: {
  #     status: {
  #       code: 401,
  #       message: 'Unauthorized'
  #     }
  #   }, status: :unauthorized
  # end

  # def jwt_token
  #   token = request.headers['Authorization']&.split(' ')&.last
  #   logger.debug "Extracted JWT token from request header: #{token}"
  #   token
  # end

  # def jwt_payload
  #   payload = JWT.decode(
  #     jwt_token,
  #     Rails.application.credentials.fetch(:secret_key_base)
  #   ).first
  #   logger.debug "Decoded JWT payload: #{payload.inspect}"
  #   payload
  # rescue JWT::DecodeError => e
  #   logger.error "Error decoding JWT token: #{e.message}"
  #   nil
  # end
  private

  # Overriding Devise's method to provide a custom response upon successful sign in
  def respond_with(_resource, _options = {})
    render json: {
      status: {
        code: 200,
        message: 'Signed in successfully',
        data: current_user
      }
    }, status: :ok
  end

  # Method to handle sign out based on JWT token
  def respond_to_on_destroy
    jwt_payload = JWT.decode(
      request.headers['Authorization'].split(' ')[1],
      Rails.application.credentials.fetch(:secret_key_base)
    ).first

    current_user = User.find_by(id: jwt_payload['sub'])

    if current_user
      # Uncomment the line below if you want to invalidate the current token on sign out
      # current_user.update(jti: SecureRandom.uuid)
      logger.info "User with ID: #{current_user.id} signed out successfully"
      render json: {
        status: 200,
        message: 'Signed out successfully'
      }, status: :ok
    else
      render json: {
        status: 401,
        message: 'No active session'
      }, status: :unauthorized
    end
  end
end
