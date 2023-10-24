class ExercisesController < ApplicationController
    before_action :authorize
    skip_before_action :authorize, only:[:create, :update, :destroy]

    def index
        exercises = Exercise.all 
        render json: exercises, status: :ok

    end
    def show
        exercise = find_exercise
        if exercise 
            render json: exercise, status: :ok
        else 
            render json: {error:"Exercise not found"}, status: :not_found
        end
    end

    def create
       # workout = Workout.find_by(id: exercise_params[:workout_id])

        exercise = Exercise.create!(exercise_params)
      # exercise.workout = workout
        if exercise 
            render json: exercise, status: :created
        else 
            render json: {error: "Problem creating exercise"}, status: :unprocessable_entity
        end
    end

    def update
        exercise = find_exercise
        if exercise 
            exercise = Exercise.update!(exercise_params)
            render json: exercise, status: :accepted
        else 
            render json: {error: "Problem updating exercise"}, status: :unprocessable_entity
        end
    end

    def destroy
        exercise = find_exercise
        if exercise
            exercise.destroy
            head :no_content
        else
            render json:{error: "Exercise not found"}, status: :not_found
        end
    end

    private

    def find_exercise
        exercise = Exercise.find_by(id: params[:id])

    end

    def exercise_params
        params.require(:exercise).permit(:name, :calories, :description, :workout_id)
    end
end