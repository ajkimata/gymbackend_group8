# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  # POST /users/sign_in
  def create
    user_params = params.require(:user).permit(:email, :username, :password)

    identifier = user_params[:email].presence || user_params[:username]
    password = user_params[:password]

    # Logging sanitized params for debugging
    logger.debug "Processed Params: #{user_params.except(:password).inspect}"

    if identifier && password
      authenticate_and_respond(identifier, password)
    else
      logger.warn 'Missing identifier or password in request'
      render_unauthorized_response
    end
  end

  private

  def authenticate_and_respond(identifier, password)
    # Attempt to find the user by email or username
    user = User.find_by(email: identifier) || User.find_by(username: identifier)

    if user&.valid_password?(password)
      logger.info "User with identifier: #{identifier} authenticated successfully"
      jwt_token = generate_jwt_token_for_user(user)
      response.headers['Authorization'] = "Bearer #{jwt_token}"
      render json: {
        status: {
          code: 200,
          message: 'User signed in successfully',
          data: {
            token: jwt_token,
            user: user
          }
        }
      }, status: :ok
    else
      logger.warn "Failed to authenticate user with identifier: #{identifier}"
      render_unauthorized_response
    end
  end

  def generate_jwt_token_for_user(user)
    jti = SecureRandom.uuid
    user.update(jti: jti) # Store the jti in the user record

    payload = {
      user_id: user.id,
      jti: jti
    }

    JWT.encode(payload, Rails.application.credentials.fetch(:secret_key_base))
  rescue StandardError => e
    logger.error "Error generating JWT token: #{e.message}"
    raise e
  end

  def render_unauthorized_response
    logger.warn 'Rendered unauthorized response'
    render json: {
      status: {
        code: 401,
        message: 'Unauthorized'
      }
    }, status: :unauthorized
  end

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
