# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(_resource, _options = {})
    render json: {
      status: {
        code: 200,
        message: 'User signed in successfully',
        data: current_user
      }
    }, status: :ok
  end

  def respond_to_on_destroy
    jwt_payload = decode_jwt_from_authorization_header
    current_user = User.find_by(id: jwt_payload['sub'])

    if current_user
      render json: {
        status: 200,
        message: 'Signed out successfully'
      }, status: :ok
    else
      render json: {
        status: 401,
        message: 'User has no active session'
      }, status: :unauthorized
    end
  rescue JWT::DecodeError, NoMethodError
    render json: {
      status: 401,
      message: 'Invalid JWT token'
    }, status: :unauthorized
  end

  def decode_jwt_from_authorization_header
    token = request.headers['Authorization']&.split(' ')&.last
    JWT.decode(token, Rails.application.credentials.fetch(:secret_key_base)).first
  end
end