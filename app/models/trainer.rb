class Trainer < ApplicationRecord
  # Remove or comment out the line below:
  # validates :email, presence: true, uniqueness: true

  has_one :user, as: :role, dependent: :destroy

  def role_type
    'Trainer'
  end
end
