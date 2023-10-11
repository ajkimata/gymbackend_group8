class Admin < ApplicationRecord

    validates :username, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true
  
    # Database tables
    # string :name
    # string :email
    # string :username
    # string :phone_number
    # string :permission
    # string :role
    
end
