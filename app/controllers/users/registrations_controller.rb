class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :set_user, only: %i[show update destroy]

  respond_to :json

  def index
    @users = User.all
    render json: @users
  end

  # def create
  #   role_type = params[:user][:role_type]
  #   puts "Request Payload: #{request.raw_post}" # Debugging
  #   puts "Role Type: #{role_type}" # Debugging

  #   # Validate the role type before attempting to create a user
  #   role = create_role(role_type, params[:user])
  #   unless role
  #     return render json: { status: { message: 'Invalid role type provided or role creation failed' } },
  #                   status: :unprocessable_entity
  #   end

  #   build_resource(sign_up_params)

  #   if resource.save
  #     # Associate the User with the created role
  #     resource.role = role
  #     resource.save

  #     respond_with_resource(resource)
  #   else
  #     # If the User couldn't be saved, send an error response
  #     render_error_response(resource)
  #   end
  # end
  def create
    user_params = params[:user]
    return render json: { status: { message: 'User params not provided' } }, status: :bad_request if user_params.nil?

    role_type = user_params[:role_type]
    puts "Request Payload: #{request.raw_post}" # Debugging
    puts "Role Type: #{role_type}" # Debugging

    # Validate the role type before attempting to create a user
    role = create_role(role_type, user_params)
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

  def show
    render json: { status: { code: 200, message: 'User fetched successfully', data: @user } }, status: :ok
  end

  def update
    if @user.update(user_params)
      render json: { status: { code: 200, message: 'User updated successfully', data: @user } }, status: :ok
    else
      render_error_response(@user)
    end
  end

  def destroy
    @user.destroy
    render json: { status: { code: 200, message: 'User deleted successfully' } }, status: :ok
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :role_type)
  end

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
