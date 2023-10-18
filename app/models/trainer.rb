class Trainer < ApplicationRecord
    has_secure_password

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
  
    # Database columns
    # string :name
    # string :email
    # string :username
    # string :phone_number
    # string :permission
    # string :role

end
