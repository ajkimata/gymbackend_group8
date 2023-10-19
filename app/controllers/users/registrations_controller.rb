# # frozen_string_literal: true

# class Users::RegistrationsController < Devise::RegistrationsController
#   before_action :configure_sign_up_params, only: [:create]
#   respond_to :json

#   # def create
#   #   # build_resource(sign_up_params)
#   #   # role = create_role(params[:role_type])
#   #   # build_resource(sign_up_params)
#   #   # role_type = params[:role_type]
#   #   # puts "Role Type: #{role_type}" # Debugging
#   #   # role = create_role(role_type)
#   #   build_resource(sign_up_params)
#   #   # role_type = params[:role_type]\
#   #   role_type = params[:user][:role_type]

#   #   puts "Request Payload: #{request.raw_post}" # Debugging
#   #   puts "Role Type: #{role_type}" # Debugging
#   #   role = create_role(role_type)
#   #   if role.nil?
#   #     return render json: { status: { message: 'Invalid role type provided' } }, status: :unprocessable_entity
#   #   end

#   #   resource.role = role

#   #   if resource.save
#   #     respond_with_resource(resource)
#   #   else
#   #     render_error_response(resource)
#   #   end
#   # end
#   def create
#     # First, build the User with the provided params
#     build_resource(sign_up_params)

#     # Try saving the User
#     if resource.save
#       # If the User is saved successfully, then create the role
#       role = create_role(params[:user][:role_type])
#       puts "Request Payload: #{request.raw_post}" # Debugging
#       puts "Role Type: #{role_type}" # Debugging
#       role = create_role(role_type)

#       if role
#         # Associate the User with the created role
#         resource.role = role
#         resource.save

#         # Send a success response
#         respond_with_resource(resource)
#       else
#         # If the role couldn't be created, destroy the previously created User to maintain data integrity
#         resource.destroy

#         # Send an error response for invalid role type
#         render json: { status: { message: 'Invalid role type provided' } }, status: :unprocessable_entity
#       end
#     else
#       # If the User couldn't be saved, send an error response
#       render_error_response(resource)
#     end
#   end

#   private

#   def configure_sign_up_params
#     devise_parameter_sanitizer.permit(:sign_up, keys: [:role_type])
#   end

#   def respond_with_resource(resource)
#     if resource.persisted?
#       render_successful_response(resource)
#     else
#       render_error_response(resource)
#     end
#   end

#   def render_successful_response(resource)
#     render json: {
#       status: {
#         code: 200,
#         message: 'Signed up successfully',
#         data: resource
#       }
#     }, status: :ok
#   end

#   def render_error_response(resource)
#     render json: {
#       status: {
#         message: 'User could not be created successfully',
#         errors: resource.errors.full_messages
#       }
#     }, status: :unprocessable_entity
#   end

#   def create_role(role_type)
#     case role_type
#     when 'Admin'
#       Admin.create
#     when 'Client'
#       Client.create
#     when 'Trainer'
#       Trainer.create
#     else
#       nil # Invalid role type
#     end
#   end
# end
# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  respond_to :json

  def create
    role_type = params[:user][:role_type]
    puts "Request Payload: #{request.raw_post}" # Debugging
    puts "Role Type: #{role_type}" # Debugging

    # Validate the role type before attempting to create a user
    role = create_role(role_type, params[:user])
    unless role
      return render json: { status: { message: 'Invalid role type provided or role creation failed' } },
                    status: :unprocessable_entity
    end

    build_resource(sign_up_params)

    if resource.save
      # Associate the User with the created role
      resource.role = role
      resource.save

      respond_with_resource(resource)
    else
      # If the User couldn't be saved, send an error response
      render_error_response(resource)
    end
  end

  private

  def configure_sign_up_params
    # Added :username, :email, and :password to permitted params for sign up
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[role_type username email password])
  end

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

  def create_role(role_type, user_params)
    case role_type
    when 'Admin'
      Admin.create(username: user_params[:username])
    when 'Client'
      Client.create(username: user_params[:username])
    when 'Trainer'
      Trainer.create(username: user_params[:username])
    else
      nil # Invalid role type
    end
  end
end
