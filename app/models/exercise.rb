class Exercise < ApplicationRecord

    has_many :workout_exercises
    has_many :workouts, through: :workout_exercises

    def self.add_exercise(name, area)
        Exercise.find_or_create_by(name: name, area: area)
    end

    def self.filter_by_area(area)
        #p area
        Exercise.all.where(area: area)
    end

end