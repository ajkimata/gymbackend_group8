# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # Uncomment the following lines if you have specific configurations for sign up or account update
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  respond_to :json

  private

  # Responds with the appropriate JSON based on the resource's state
  def respond_with_resource(resource)
    if resource.persisted?
      render_successful_response(resource)
    else
      render_error_response(resource)
    end
  end

  def render_successful_response(resource)
    render json: {
      status: {
        code: 200,
        message: 'Signed up successfully',
        data: resource
      }
    }, status: :ok
  end

  def render_error_response(resource)
    render json: {
      status: {
        message: 'User could not be created successfully',
        errors: resource.errors.full_messages
      }
    }, status: :unprocessable_entity
  end
end
