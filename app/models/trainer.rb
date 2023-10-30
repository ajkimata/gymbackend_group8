class Trainer < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_one :user, as: :role, dependent: :destroy

  def role_type
    'Trainer'
  end
end
