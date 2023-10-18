class Client < ApplicationRecord
    has_secure_password

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
  
    # Database columns
    # string :name
    # string :email
    # string :username
    # string :phone_number
    # string :membership_type
    # date :membership_start_date
    # date :membership_end_date
    # integer :trainer_id
    # text :fitness_goals
    # string :role
    # text :review_text
    # date :review_date

end
