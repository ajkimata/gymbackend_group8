class exercise < ApplicationRecord
    belongs_to :workout
   
  
    has_many :exercise_logs
  
    validates :name, presence: true
    validates :description, presence: true, length: { minimum: 20 }
    validates :calories, presence: true, numericality: {only_integer: true}
  
  
  end