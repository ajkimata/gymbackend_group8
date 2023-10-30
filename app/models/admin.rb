class Admin < ApplicationRecord
  # Validations
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  # Associations
  has_one :user, as: :role
  has_many :payments
  has_many :employee_performances
  has_many :equipments
  has_many :maintenances
  has_many :supplement_ads
end
