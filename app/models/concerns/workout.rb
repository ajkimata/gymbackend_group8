class workout < ApplicationRecord
    has_many :exercise_logs
    has_many :users, through: :exercise_logs
    has_many :exercises

    validates :name, presence: true
   
    validates :category, presence: true

end