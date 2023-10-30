class WorkoutExercise < ApplicationRecord
    belongs_to :exercise
    belongs_to :workout
    has_many :workout_sets

    def self.add_workout_exercise(workout_id, exercise_id)
        WorkoutExercise.find_or_create_by(workout_id: workout_id, exercise_id: exercise_id)
    end

end