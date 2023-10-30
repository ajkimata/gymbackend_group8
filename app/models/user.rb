class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # belongs_to :role, polymorphic: true
  belongs_to :role, polymorphic: true, class_name: 'Trainer', optional: true
  has_many :workouts
  has_many :equipments, through: :workouts

  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  # def jwt_payload
  #   super
  # end
end
