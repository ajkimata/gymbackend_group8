class WorkoutsController < ApplicationController
  before_action :set_workout, only: %i[show update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :check_ownership, only: %i[update destroy]

  def index
    @workouts = Workout.all
    render json: @workouts
  end

  def show
    if @workout
      render json: @workout
    else
      render json: { error: 'Workout not found' }, status: :not_found
    end
  end

  def create
    @workout = current_user.workouts.build(workout_params)
    if @workout.save
      render json: { message: 'You have successfully created a workout!', workout: @workout }, status: :created
    else
      render json: { error: 'Please make sure you fill out all fields before creating your workout!' },
             status: :unprocessable_entity
    end
  end

  def update
    if @workout.update(workout_params)
      render json: { message: 'Successfully edited workout!', workout: @workout }
    else
      render json: { error: 'Please make sure you fill out all fields when editing!' }, status: :unprocessable_entity
    end
  end

  def destroy
    if @workout.destroy
      render json: { message: 'You have successfully deleted your workout!' }
    else
      render json: { error: 'Failed to delete workout' }, status: :unprocessable_entity
    end
  end

  private

  def set_workout
    @workout = Workout.find_by(id: params[:id])
  end

  def workout_params
    params.require(:workout).permit(:name, :description, :instructions, :workout_time, :experience_needed, :equipment_needed)
  end

  def check_ownership
    unless @workout.user == current_user
      render json: { error: 'You are not authorized to access this section' },
             status: :forbidden
    end
  end
end
