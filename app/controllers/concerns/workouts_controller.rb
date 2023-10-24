class WorkoutsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_workout
    rescue_from ActiveRecord::RecordNotFound, with: :workout_not_found
   
    def create 
        workout = Workout.create!(workout_params)
        render json: workout
    end

    def index 
        workout = Workout.all 
        render json: workout,status: :ok
    end

    def show
        workout = Workout.find(params[:id])
        render json: workout, serializer: ShowExerciseSerializer, status: :ok
    end

    def update 
        workout = Workout.find(params[:id])
        workout.update!(workout_params)
        render json: workout
    end

    def destroy 
        workout = Workout.find(params[:id])
        workout.destroy
    end


   private 

   def workout_params 
    params.permit(:name, :weight, :instructor, :category)
   end

   def invalid_workout 
   render json:{ "errors": ["validation errors"]}, status: :unprocessable_entity
   end

   def workout_not_found 
    render json: { "error": "Workout not found"}, status: :not_found
   end

end