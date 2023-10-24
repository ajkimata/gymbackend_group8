class user < ApplicationRecord
    has_secure_password

   has_many :exercise_logs
   has_many :workouts, through: :exercise_logs


   validates :user_name, presence: true, length: {minimum:3}
   validates :full_name, presence: true, length: {minimum:6}
end